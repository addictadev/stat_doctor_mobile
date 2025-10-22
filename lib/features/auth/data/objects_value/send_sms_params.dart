import 'package:equatable/equatable.dart';

class SendSmsParams extends Equatable {
  final String countryCode;
  final String phone;

  const SendSmsParams({required this.countryCode, required this.phone});

  Map<String, dynamic> toJson() => {
    "mobileNumber" : phone,
    "countryCode" : countryCode,
};

  @override
  List<Object?> get props => [countryCode, phone];
}