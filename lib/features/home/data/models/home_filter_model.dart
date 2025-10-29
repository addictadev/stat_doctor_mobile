import 'package:equatable/equatable.dart';
import 'package:stat_doctor/features/home/data/models/home_filter_option_model.dart';

class HomeFilterModel extends Equatable {
  final List<String> timeType;
  final List<HomeFilterOptionModel> filterSkills;
  final List<HomeFilterOptionModel> filterSpecialties;

  const HomeFilterModel({required this.timeType, required this.filterSkills, required this.filterSpecialties});

  factory HomeFilterModel.fromJson(Map<String, dynamic> json) => HomeFilterModel(
    timeType: (json['timeType'] as List).map((e) => e.toString()).toList(),
    filterSkills: (json['skillLevelList'] as List).map((e) => HomeFilterOptionModel.fromJson(e)).toList(),
    filterSpecialties: (json['specialtyList'] as List).map((e) => HomeFilterOptionModel.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'timeType': timeType,
    'skillLevelList': filterSkills,
    'specialtyList': filterSpecialties,
  };

  @override
  List<Object?> get props => [timeType, filterSkills, filterSpecialties];
}