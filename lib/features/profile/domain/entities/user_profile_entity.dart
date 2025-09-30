
class UserProfileEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? profileImagePath;
  final String? profileImageUrl;
  final String? title; // Dr., etc.
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UserProfileEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.profileImagePath,
    this.profileImageUrl,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  // Computed properties
  String get fullName => '$firstName $lastName';
  String get displayName => title != null ? '$title $fullName' : fullName;
  String get initials => '${firstName.isNotEmpty ? firstName[0] : ''}${lastName.isNotEmpty ? lastName[0] : ''}'.toUpperCase();

  // Helper method to get profile image
  String? get profileImage => profileImageUrl ?? profileImagePath;

  // Copy with method
  UserProfileEntity copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? profileImagePath,
    String? profileImageUrl,
    String? title,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfileEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserProfileEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'UserProfileEntity(id: $id, name: $fullName, email: $email)';
  }
}
