import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_info_vo.g.dart';

@HiveType(typeId: 1)
class UserInfoVO extends Equatable {
  @HiveField(0)
  final String mobileNumber;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String firstName;
  @HiveField(3)
  final String surname;
  @HiveField(4)
  final String profilePic;
  @HiveField(5)
  final int? disabledTime;
  @HiveField(6)
  final int? deletedTime;
  @HiveField(7)
  final int? createTime;
  @HiveField(8)
  final int completedShifts;
  @HiveField(9)
  final bool? favouritesFlag;
  @HiveField(10)
  final String phoneCode;

  const UserInfoVO({
    required this.mobileNumber,
    required this.email,
    required this.firstName,
    required this.surname,
    required this.profilePic,
    this.disabledTime,
    this.deletedTime,
    this.createTime,
    required this.completedShifts,
    this.favouritesFlag,
    required this.phoneCode,
  });

  factory UserInfoVO.fromJson(Map<String, dynamic> json) {
    return UserInfoVO(
      mobileNumber: json['mobileNumber'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      surname: json['surname'] ?? '',
      profilePic: json['profilePic'] ?? '',
      disabledTime: json['disabledTime'],
      deletedTime: json['deletedTime'],
      createTime: json['createTime'],
      completedShifts: json['completedShifts'] ?? 0,
      favouritesFlag: json['favouritesFlag'],
      phoneCode: json['phoneCode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobileNumber': mobileNumber,
      'email': email,
      'firstName': firstName,
      'surname': surname,
      'profilePic': profilePic,
      'disabledTime': disabledTime,
      'deletedTime': deletedTime,
      'createTime': createTime,
      'completedShifts': completedShifts,
      'favouritesFlag': favouritesFlag,
      'phoneCode': phoneCode,
    };
  }

  UserInfoVO copyWith({
    String? mobileNumber,
    String? email,
    String? firstName,
    String? surname,
    String? profilePic,
    int? disabledTime,
    int? deletedTime,
    int? createTime,
    int? completedShifts,
    bool? favouritesFlag,
    String? phoneCode,
  }) {
    return UserInfoVO(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      surname: surname ?? this.surname,
      profilePic: profilePic ?? this.profilePic,
      disabledTime: disabledTime ?? this.disabledTime,
      deletedTime: deletedTime ?? this.deletedTime,
      createTime: createTime ?? this.createTime,
      completedShifts: completedShifts ?? this.completedShifts,
      favouritesFlag: favouritesFlag ?? this.favouritesFlag,
      phoneCode: phoneCode ?? this.phoneCode,
    );
  }

  @override
  List<Object?> get props => [
        mobileNumber,
        email,
        firstName,
        surname,
        profilePic,
        disabledTime,
        deletedTime,
        createTime,
        completedShifts,
        favouritesFlag,
        phoneCode,
      ];
}
