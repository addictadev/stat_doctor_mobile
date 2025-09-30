import 'package:stat_doctor/features/profile/domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    super.profileImagePath,
    super.profileImageUrl,
    super.title,
    super.createdAt,
    super.updatedAt,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profileImagePath: json['profileImagePath'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      title: json['title'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImagePath': profileImagePath,
      'profileImageUrl': profileImageUrl,
      'title': title,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  // Factory method to create sample data for testing
  factory UserProfileModel.sample() {
    return UserProfileModel(
      id: '1',
      firstName: 'Sarah',
      lastName: 'Cooper',
      email: 'sarahcooper@gmail.com',
      phoneNumber: '0412 123 123',
      title: 'Dr.',
      profileImageUrl: null, // Will use placeholder
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    );
  }
}
