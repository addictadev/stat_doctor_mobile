// ignore_for_file: use_build_context_synchronously
import 'package:dartz/dartz.dart';
import 'package:stat_doctor/core/extensions/localization.dart';
import 'package:stat_doctor/core/injection/injection_container.dart';
import 'package:stat_doctor/core/navigation/app_navigator.dart';
import 'package:stat_doctor/core/network/network_service/exceptions.dart';
import 'package:stat_doctor/core/network/network_service/failures.dart';
import 'package:flutter/material.dart';

mixin RepositoryHelper {
  static final BuildContext _context = sl<AppNavigator>().navigatorKey.currentContext!;
  Future<Either<Failure, T>> handleEither<T>(Future<T> Function() call) async {
    try {
      final result = await call();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on ValidationException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: '${_context.tr.errorUnexpectedError}: $e'));
    }
  }
}
