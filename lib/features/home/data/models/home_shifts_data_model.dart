import 'package:equatable/equatable.dart';
import 'package:stat_doctor/features/home/data/models/home_shift_model.dart';

class HomeShiftsDataModel extends Equatable {
  final int pageNo;
  final bool hasNextPage;
  final List<HomeShiftModel> workedList;
  final List<HomeShiftModel> interestedList;
  final List<HomeShiftModel> nearList;

  const HomeShiftsDataModel({
    required this.pageNo,
    this.hasNextPage = true,
    required this.workedList,
    required this.interestedList,
    required this.nearList,
  });

  factory HomeShiftsDataModel.fromJson(Map<String, dynamic> json) => HomeShiftsDataModel(
    pageNo: json['pageNo'],
    workedList: (json['workedList'] as List).map((e) => HomeShiftModel.fromJson(e)).toList(),
    interestedList: (json['interestedList'] as List).map((e) => HomeShiftModel.fromJson(e)).toList(),
    nearList: (json['nearList'] as List).map((e) => HomeShiftModel.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'pageNo': pageNo,
    'workedList': workedList.map((e) => e.toJson()).toList(),
    'interestedList': interestedList.map((e) => e.toJson()).toList(),
    'nearList': nearList.map((e) => e.toJson()).toList(),
  };

  HomeShiftsDataModel copyWith({
    int? pageNo,
    bool? hasNextPage,
    List<HomeShiftModel>? workedList,
    List<HomeShiftModel>? interestedList,
    List<HomeShiftModel>? nearList,
  }) => HomeShiftsDataModel(
    pageNo: pageNo ?? this.pageNo,
    hasNextPage: hasNextPage ?? this.hasNextPage,
    workedList: workedList ?? this.workedList,
    interestedList: interestedList ?? this.interestedList,
    nearList: nearList ?? this.nearList,
  );

  @override
  List<Object?> get props => [pageNo, hasNextPage, workedList, interestedList, nearList];
}

