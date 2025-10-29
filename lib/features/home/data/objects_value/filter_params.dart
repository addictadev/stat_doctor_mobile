import 'package:equatable/equatable.dart';
import 'package:stat_doctor/features/options/data/model/options.dart';

class FilterParams extends Equatable {
  final List<DateTime> selectedDates;
  final int? selectedShiftIndex;
  final double? distanceValue;
  final Options? selectedSkill;
  final Options? selectedSpecialty;
  
  const FilterParams({
    this.selectedDates = const [],
    this.selectedShiftIndex,
    this.distanceValue = 0,
    this.selectedSkill,
    this.selectedSpecialty
  });

  FilterParams copyWith({
    List<DateTime>? selectedDates,
    int? selectedShiftIndex,
    double? distanceValue,
    Options? selectedSkill,
    Options? selectedSpecialty
  }) {
    return FilterParams(
      selectedDates: selectedDates ?? this.selectedDates,
      selectedShiftIndex: selectedShiftIndex ?? this.selectedShiftIndex,
      distanceValue: distanceValue ?? this.distanceValue,
      selectedSkill: selectedSkill ?? this.selectedSkill,
      selectedSpecialty: selectedSpecialty ?? this.selectedSpecialty,
    );
  }

  @override
  List<Object?> get props => [selectedDates, selectedShiftIndex, distanceValue, selectedSkill, selectedSpecialty];
}