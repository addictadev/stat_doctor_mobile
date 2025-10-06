enum ReferenceStatus {
  pending,
  verified,
  rejected,
}

extension ReferenceStatusExtension on ReferenceStatus {
  String get displayName {
    switch (this) {
      case ReferenceStatus.pending:
        return 'Verification pending';
      case ReferenceStatus.verified:
        return 'Verified';
      case ReferenceStatus.rejected:
        return 'Rejected';
    }
  }

  String get colorName {
    switch (this) {
      case ReferenceStatus.pending:
        return 'orange';
      case ReferenceStatus.verified:
        return 'green';
      case ReferenceStatus.rejected:
        return 'red';
    }
  }
}

class ReferenceModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String email;
  final String specialty;
  final String seniority;
  final String currentHospital;
  final DateTime dueDate;
  final ReferenceStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ReferenceModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.specialty,
    required this.seniority,
    required this.currentHospital,
    required this.dueDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  ReferenceModel copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    String? email,
    String? specialty,
    String? seniority,
    String? currentHospital,
    DateTime? dueDate,
    ReferenceStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ReferenceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      specialty: specialty ?? this.specialty,
      seniority: seniority ?? this.seniority,
      currentHospital: currentHospital ?? this.currentHospital,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'specialty': specialty,
      'seniority': seniority,
      'currentHospital': currentHospital,
      'dueDate': dueDate.toIso8601String(),
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory ReferenceModel.fromJson(Map<String, dynamic> json) {
    return ReferenceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      specialty: json['specialty'] as String,
      seniority: json['seniority'] as String,
      currentHospital: json['currentHospital'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      status: ReferenceStatus.values.firstWhere(
        (status) => status.name == json['status'],
        orElse: () => ReferenceStatus.pending,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReferenceModel &&
        other.id == id &&
        other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.email == email &&
        other.specialty == specialty &&
        other.seniority == seniority &&
        other.currentHospital == currentHospital &&
        other.dueDate == dueDate &&
        other.status == status &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        specialty.hashCode ^
        seniority.hashCode ^
        currentHospital.hashCode ^
        dueDate.hashCode ^
        status.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
