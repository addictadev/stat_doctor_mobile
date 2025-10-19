import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String countryCode;
  final String phone;
  final String code;

  const LoginParams({required this.countryCode, required this.phone, required this.code});

  Map<String, dynamic> toJson() => {
    "mobileNumber" : phone,
    "code" : code,
    "countryCode" : countryCode,
    "accountType" : "mobileNumber"
};

  @override
  List<Object?> get props => [countryCode, phone, code];
}