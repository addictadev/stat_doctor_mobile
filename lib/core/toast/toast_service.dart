import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stat_doctor/core/toast/app_toast.dart';
import 'package:stat_doctor/core/toast/custom_toast.dart';

/// Manages toast view state using ValueNotifier
class ToastViewManager<T> extends ValueNotifier<T> {
  ToastViewManager(super.val);
}

/// Service for managing toast notifications
class ToastService {
  static final ToastViewManager<int> _expandedIndex = ToastViewManager<int>(-1);
  static final List<OverlayEntry?> _overlayEntries = [];
  static final List<double> _overlayPositions = [];
  static final List<int> _overlayIndexList = [];
  static final List<AnimationController?> _animationControllers = [];
  static OverlayState? _overlayState;
  static int? _showToastNumber;

  /// Sets the maximum number of toasts to show simultaneously
  static void showToastNumber(int val) {
    assert(val > 0, "Show toast number can't be negative or zero. Default show toast number is 5.");
    if (val > 0) {
      _showToastNumber = val;
    }
  }

  /// Reverses the animation and removes the toast
  static void _reverseAnimation(int index) {
    if (_overlayIndexList.contains(index)) {
      _animationControllers[index]?.reverse().then((_) async {
        await Future.delayed(const Duration(milliseconds: 50));
        _removeOverlayEntry(index);
      });
    }
  }

  /// Removes the overlay entry and cleans up resources
  static void _removeOverlayEntry(int index) {
    _overlayEntries[index]?.remove();
    _animationControllers[index]?.dispose();
    _overlayIndexList.remove(index);
  }

  /// Starts the forward animation
  static void _forwardAnimation(int index) {
    _overlayState?.insert(_overlayEntries[index]!);
    _animationControllers[index]?.forward();
  }

  /// Calculates the position for a toast
  static double _calculatePosition(int index) {
    return _overlayPositions[index];
  }

  /// Adds a new overlay position
  static void _addOverlayPosition(int index) {
    _overlayPositions.add(40);
    _overlayIndexList.add(index);
  }

  /// Checks if a toast is in the front layer
  static bool _isToastInFront(int index) => index > _overlayPositions.length - 5;

  /// Updates overlay positions based on direction
  static void _updateOverlayPositions({bool isReverse = false, int pos = 0}) {
    if (isReverse) {
      _reverseUpdatePositions(pos: pos);
    } else {
      _forwardUpdatePositions();
    }
  }

  /// Rebuilds all overlay positions
  static void _rebuildPositions() {
    for (int i = 0; i < _overlayPositions.length; i++) {
      _overlayEntries[i]?.markNeedsBuild();
    }
  }

  /// Updates positions when removing toasts
  static void _reverseUpdatePositions({int pos = 0}) {
    for (int i = pos - 1; i >= 0; i--) {
      _overlayPositions[i] = _overlayPositions[i] - 10;
      _overlayEntries[i]?.markNeedsBuild();
    }
  }

  /// Updates positions when adding toasts
  static void _forwardUpdatePositions() {
    for (int i = 0; i < _overlayPositions.length; i++) {
      _overlayPositions[i] = _overlayPositions[i] + 10;
      _overlayEntries[i]?.markNeedsBuild();
    }
  }

  /// Calculates opacity based on toast position
  static double _calculateOpacity(int index) {
    int noOfShowToast = _showToastNumber ?? 5;
    if (_overlayIndexList.length <= noOfShowToast) return 1;
    final isFirstFiveToast = _overlayIndexList.sublist(_overlayIndexList.length - noOfShowToast).contains(index);
    return isFirstFiveToast ? 1 : 0;
  }

  /// Toggles the expanded state of a toast
  static void _toggleExpand(int index) {
    if (_expandedIndex.value == index) {
      _expandedIndex.value = -1;
    } else {
      _expandedIndex.value = index;
    }
    _rebuildPositions();
  }

  /// Converts ToastLength to Duration
  static Duration _toastDuration(ToastLength length) {
    return switch (length) {
      ToastLength.short => const Duration(milliseconds: 2000),
      ToastLength.medium => const Duration(milliseconds: 4000),
      ToastLength.long => const Duration(milliseconds: 6000),
      ToastLength.ages => const Duration(minutes: 2),
      ToastLength.never => Duration.zero
    };
  }

  /// Internal method to show toast with all parameters
  static Future<void> _showToast(
    BuildContext context, {
    required ToastType type,
    required String message,
    String? description,
    required ToastOptions options,
  }) async {
    assert(options.expandedHeight >= 0.0, "Expanded height should not be a negative number!");
    
    if (context.mounted) {
      _overlayState = Overlay.of(context);
      final controller = AnimationController(
        vsync: _overlayState!,
        duration: const Duration(milliseconds: 1000),
        reverseDuration: const Duration(milliseconds: 1000),
      );
      _animationControllers.add(controller);
      int controllerIndex = _animationControllers.indexOf(controller);
      _addOverlayPosition(controllerIndex);
      
      final overlayEntry = OverlayEntry(
        builder: (context) => AnimatedPositioned(
          top: options.topView 
            ? _calculatePosition(controllerIndex) + (_expandedIndex.value == controllerIndex ? options.expandedHeight : 0.0) 
            : null,
          left: 10,
          right: 10,
          bottom: options.topView ? null : 30,
          duration: const Duration(milliseconds: 500),
          curve: options.positionCurve,
          child: Dismissible(
            key: Key(UniqueKey().toString()),
            direction: options.dismissDirection,
            onDismissed: (_) {
              _removeOverlayEntry(_animationControllers.indexOf(controller));
              _updateOverlayPositions(
                isReverse: true,
                pos: _animationControllers.indexOf(controller),
              );
            },
            child: AnimatedPadding(
              padding: EdgeInsets.symmetric(
                horizontal: (_expandedIndex.value == controllerIndex 
                  ? 10 
                  : max(_calculatePosition(controllerIndex) - 35, 0.0))
              ),
              duration: const Duration(milliseconds: 500),
              curve: options.positionCurve,
              child: AnimatedOpacity(
                opacity: _calculateOpacity(controllerIndex),
                duration: const Duration(milliseconds: 500),
                child: CustomToast(
                  type: type,
                  message: message,
                  description: description,
                  messageStyle: options.messageStyle,
                  descriptionStyle: options.descriptionStyle,
                  curve: options.slideCurve,
                  isClosable: options.isClosable,
                  isInFront: _isToastInFront(_animationControllers.indexOf(controller)),
                  controller: controller,
                  onTap: () => _toggleExpand(controllerIndex),
                  onClose: () {
                    _removeOverlayEntry(_animationControllers.indexOf(controller));
                    _updateOverlayPositions(
                      isReverse: true, 
                      pos: _animationControllers.indexOf(controller)
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
      
      _overlayEntries.add(overlayEntry);
      _updateOverlayPositions();
      _forwardAnimation(_animationControllers.indexOf(controller));
      await Future.delayed(_toastDuration(options.length));
      _reverseAnimation(_animationControllers.indexOf(controller));
    }
  }

  /// Shows a toast notification with the specified parameters
  static Future<void> showToast(
    BuildContext context, {
    required ToastType type,
    required String message,
    String? description,
    ToastOptions? options,
  }) async {
    final defaultOptions = const ToastOptions();
    final finalOptions = options ?? defaultOptions;
    
    await _showToast(
      context,
      type: type,
      message: message,
      description: description,
      options: finalOptions,
    );
  }
}