import 'package:equatable/equatable.dart';
import 'package:stat_doctor/features/options/data/model/options.dart';

class FilterParams extends Equatable {
  final DateTime? selectedDay;
  final int? selectedShiftIndex;
  final double? distanceValue;
  final Options? selectedSkill;
  final Options? selectedSpecialty;
  
  const FilterParams({
    this.selectedDay,
    this.selectedShiftIndex,
    this.distanceValue = 0,
    this.selectedSkill,
    this.selectedSpecialty
  });

  FilterParams copyWith({
    DateTime? selectedDay,
    int? selectedShiftIndex,
    double? distanceValue,
    Options? selectedSkill,
    Options? selectedSpecialty
  }) {
    return FilterParams(
      selectedDay: selectedDay ?? this.selectedDay,
      selectedShiftIndex: selectedShiftIndex ?? this.selectedShiftIndex,
      distanceValue: distanceValue ?? this.distanceValue,
      selectedSkill: selectedSkill ?? this.selectedSkill,
      selectedSpecialty: selectedSpecialty ?? this.selectedSpecialty,
    );
  }

  @override
  List<Object?> get props => [selectedDay, selectedShiftIndex, distanceValue, selectedSkill, selectedSpecialty];
}