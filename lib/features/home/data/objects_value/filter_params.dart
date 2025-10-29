import 'package:equatable/equatable.dart';
import 'package:stat_doctor/features/home/data/models/home_filter_option_model.dart';

class FilterParams extends Equatable {
  final List<DateTime> selectedDates;
  final String? selectedShift;
  final double? distanceValue;
  final HomeFilterOptionModel? selectedSkill;
  final HomeFilterOptionModel? selectedSpecialty;
  
  const FilterParams({
    this.selectedDates = const [],
    this.selectedShift,
    this.distanceValue = 0,
    this.selectedSkill,
    this.selectedSpecialty
  });

  FilterParams copyWith({
    List<DateTime>? selectedDates,
    String? selectedShift,
    double? distanceValue,
    HomeFilterOptionModel? selectedSkill,
    HomeFilterOptionModel? selectedSpecialty
  }) {
    return FilterParams(
      selectedDates: selectedDates ?? this.selectedDates,
      selectedShift: selectedShift ?? this.selectedShift,
      distanceValue: distanceValue ?? this.distanceValue,
      selectedSkill: selectedSkill ?? this.selectedSkill,
      selectedSpecialty: selectedSpecialty ?? this.selectedSpecialty,
    );
  }

  @override
  List<Object?> get props => [selectedDates, selectedShift, distanceValue, selectedSkill, selectedSpecialty];
}