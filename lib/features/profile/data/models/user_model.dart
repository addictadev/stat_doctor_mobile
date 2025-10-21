import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'user_info_vo.dart';
import 'medical_vo.dart';
import 'references_vo.dart';
import 'doc_vo.dart';

part 'user_model.g.dart';

@HiveType(typeId: 5)
class UserModel extends Equatable {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final bool registerFlag;
  @HiveField(2)
  final UserInfoVO userInfoVO;
  @HiveField(3)
  final MedicalVO medicalVO;
  @HiveField(4)
  final int medicalLastTime;
  @HiveField(5)
  final List<ReferencesVO> referencesVOList;
  @HiveField(6)
  final int referencesLastTime;
  @HiveField(7)
  final DocVO docVO;
  @HiveField(8)
  final int docLastTime;

  const UserModel({
    required this.userId,
    required this.registerFlag,
    required this.userInfoVO,
    required this.medicalVO,
    required this.medicalLastTime,
    required this.referencesVOList,
    required this.referencesLastTime,
    required this.docVO,
    required this.docLastTime,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? '',
      registerFlag: json['registerFlag'] ?? false,
      userInfoVO: UserInfoVO.fromJson(json['userInfoVO'] ?? {}),
      medicalVO: MedicalVO.fromJson(json['medicalVO'] ?? {}),
      medicalLastTime: json['medicalLastTime'] ?? 0,
      referencesVOList: (json['referencesVOList'] as List<dynamic>?)?.map((item) => ReferencesVO.fromJson(item as Map<String, dynamic>)).toList() ?? [],
      referencesLastTime: json['referencesLastTime'] ?? 0,
      docVO: DocVO.fromJson(json['docVO'] ?? {}),
      docLastTime: json['docLastTime'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'registerFlag': registerFlag,
      'userInfoVO': userInfoVO.toJson(),
      'medicalVO': medicalVO.toJson(),
      'medicalLastTime': medicalLastTime,
      'referencesVOList': referencesVOList.map((item) => item.toJson()).toList(),
      'referencesLastTime': referencesLastTime,
      'docVO': docVO.toJson(),
      'docLastTime': docLastTime,
    };
  }

  UserModel copyWith({
    String? userId,
    bool? registerFlag,
    UserInfoVO? userInfoVO,
    MedicalVO? medicalVO,
    int? medicalLastTime,
    List<ReferencesVO>? referencesVOList,
    int? referencesLastTime,
    DocVO? docVO,
    int? docLastTime,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      registerFlag: registerFlag ?? this.registerFlag,
      userInfoVO: userInfoVO ?? this.userInfoVO,
      medicalVO: medicalVO ?? this.medicalVO,
      medicalLastTime: medicalLastTime ?? this.medicalLastTime,
      referencesVOList: referencesVOList ?? this.referencesVOList,
      referencesLastTime: referencesLastTime ?? this.referencesLastTime,
      docVO: docVO ?? this.docVO,
      docLastTime: docLastTime ?? this.docLastTime,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        registerFlag,
        userInfoVO,
        medicalVO,
        medicalLastTime,
        referencesVOList,
        referencesLastTime,
        docVO,
        docLastTime,
      ];
}
