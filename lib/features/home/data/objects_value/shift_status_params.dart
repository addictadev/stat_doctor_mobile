import 'package:equatable/equatable.dart';

class ShiftStatusParams extends Equatable{
  final String status;
  final String title;

  const ShiftStatusParams({required this.status, required this.title});

  static const List<ShiftStatusParams> shiftStatusList = [
    ShiftStatusParams(status: 'closestToMe', title: 'Closest to me'),
    ShiftStatusParams(status: 'maximumRate', title: 'Maximum rate'),
  ];

  @override
  List<Object?> get props => [status, title];
}