import 'package:equatable/equatable.dart';

class HospitalVO extends Equatable {
  final String accountId;
  final String hospitalLocation;
  final String? city;
  final String adminName;
  final String mobileNumber;
  final String hospitalImage;
  final String hospitalBackground;
  final String hospitalName;
  final String hospitalDescription;
  final String webSite;
  final String email;
  final double longitude;
  final double latitude;
  final int deletedTime;
  final bool favouritesFlag;
  final double distance;

  const HospitalVO({
    required this.accountId,
    required this.hospitalLocation,
    this.city,
    required this.adminName,
    required this.mobileNumber,
    required this.hospitalImage,
    required this.hospitalBackground,
    required this.hospitalName,
    required this.hospitalDescription,
    required this.webSite,
    required this.email,
    required this.longitude,
    required this.latitude,
    required this.deletedTime,
    required this.favouritesFlag,
    required this.distance,
  });

  factory HospitalVO.fromJson(Map<String, dynamic> json) => HospitalVO(
    accountId: json['accountId'],
    hospitalLocation: json['hospitalLocation'],
    city: json['city'],
    adminName: json['adminName'],
    mobileNumber: json['mobileNumber'],
    hospitalImage: json['hospitalImage'],
    hospitalBackground: json['hospitalBackground'],
    hospitalName: json['hospitalName'],
    hospitalDescription: json['hospitalDescription'],
    webSite: json['webSite'],
    email: json['email'],
    longitude: json['longitude'],
    latitude: json['latitude'],
    deletedTime: json['deletedTime'],
    favouritesFlag: json['favouritesFlag'],
    distance: json['distance'],
  );

  Map<String, dynamic> toJson() => {
    'accountId': accountId,
    'hospitalLocation': hospitalLocation,
    'city': city,
    'adminName': adminName,
    'mobileNumber': mobileNumber,
    'hospitalImage': hospitalImage,
    'hospitalBackground': hospitalBackground,
    'hospitalName': hospitalName,
    'hospitalDescription': hospitalDescription,
    'webSite': webSite,
    'email': email,
    'longitude': longitude,
    'latitude': latitude,
    'deletedTime': deletedTime,
    'favouritesFlag': favouritesFlag,
    'distance': distance,
  };

  @override
  List<Object?> get props => [
    accountId,
    hospitalLocation,
    city,
    adminName,
    mobileNumber,
    hospitalImage,
    hospitalBackground,
    hospitalName,
    hospitalDescription,
    webSite,
    email,
    longitude,
    latitude,
    deletedTime,
    favouritesFlag,
    distance,
  ];
}

