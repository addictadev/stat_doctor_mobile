import 'package:equatable/equatable.dart';
import 'package:stat_doctor/core/methods/covert_datetime_to_string.dart';
import 'package:stat_doctor/features/home/data/models/home_filter_option_model.dart';

class FilterParams extends Equatable {
  final List<DateTime> selectedDates;
  final String selectedShift;
  final double? distanceValue;
  final double? latitude;
  final double? longitude;
  final HomeFilterOptionModel? selectedSkill;
  final HomeFilterOptionModel? selectedSpecialty;
  final String? search;
  final int pageNo;
  final String? status;

  const FilterParams({
    this.selectedDates = const [],
    this.selectedShift = "All",
    this.distanceValue = 0,
    this.latitude = 0,
    this.longitude = 0,
    this.selectedSkill,
    this.selectedSpecialty,
    this.search,
    this.pageNo = 0,
    this.status,
  });


  Map<String, dynamic> toJson() => {
    if(selectedDates.isNotEmpty)'shiftsDaysList': selectedDates.map((date) => ConvertDateTime.formatDate(date)).toList(),
    if(selectedShift != "All")'timeType': selectedShift,
    if(distanceValue != null && distanceValue != 0)'distance': distanceValue,
    'latitude': latitude,
    'longitude': longitude,
    if(selectedSkill != null)'skillLevel': selectedSkill?.id ?? '',
    if(selectedSpecialty != null)'speciality': selectedSpecialty?.id ?? '',
    if(search?.isNotEmpty ?? false)'keyWord': search,
  };

  FilterParams copyWith({
    List<DateTime>? selectedDates,
    String? selectedShift,
    double? distanceValue,
    double? latitude,
    double? longitude,
    HomeFilterOptionModel? selectedSkill,
    HomeFilterOptionModel? selectedSpecialty,
    String? search,
    int? pageNo,
    String? status,
  }) {
    return FilterParams(
      selectedDates: selectedDates ?? this.selectedDates,
      selectedShift: selectedShift ?? this.selectedShift,
      distanceValue: distanceValue ?? this.distanceValue,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      selectedSkill: selectedSkill ?? this.selectedSkill,
      selectedSpecialty: selectedSpecialty ?? this.selectedSpecialty,
      search: search,
      pageNo: pageNo ?? this.pageNo,
      status: status ?? this.status,
    );
  }

  FilterParams reset() {
    return FilterParams(
      selectedDates: [],
      selectedShift: "All",
      latitude: latitude,
      longitude: longitude,
      distanceValue: 0,
      selectedSkill: null,
      selectedSpecialty: null,
      search: null,
      pageNo: 0,
      status: status,
    );
  }

  @override
  List<Object?> get props => [selectedDates, selectedShift, distanceValue, latitude, longitude, selectedSkill, selectedSpecialty, search];
}