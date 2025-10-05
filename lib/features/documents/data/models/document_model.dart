enum DocumentType {
  proofOfIdentity,
  centrelinkCard,
  medicalDegree,
  policeCheck,
  workVisa,
  medicalIndemnityInsurance,
  workingWithChildrenCheck,
  vaccinationCertificate,
  medicareCard,
  approvalForSecondaryEmployment,
}

enum DocumentStatus {
  notSupplied,
  uploaded,
  pending,
  verified,
  rejected,
}

class DocumentModel {
  final String id;
  final DocumentType type;
  final String name;
  final String fileName;
  final DocumentStatus status;
  final int points;
  final DateTime? uploadedAt;
  final DateTime? expiresAt;
  final bool isRequired;

  const DocumentModel({
    required this.id,
    required this.type,
    required this.name,
    required this.fileName,
    required this.status,
    this.points = 0,
    this.uploadedAt,
    this.expiresAt,
    this.isRequired = true,
  });

  DocumentModel copyWith({
    String? id,
    DocumentType? type,
    String? name,
    String? fileName,
    DocumentStatus? status,
    int? points,
    DateTime? uploadedAt,
    DateTime? expiresAt,
    bool? isRequired,
  }) {
    return DocumentModel(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      fileName: fileName ?? this.fileName,
      status: status ?? this.status,
      points: points ?? this.points,
      uploadedAt: uploadedAt ?? this.uploadedAt,
      expiresAt: expiresAt ?? this.expiresAt,
      isRequired: isRequired ?? this.isRequired,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'name': name,
      'fileName': fileName,
      'status': status.name,
      'points': points,
      'uploadedAt': uploadedAt?.toIso8601String(),
      'expiresAt': expiresAt?.toIso8601String(),
      'isRequired': isRequired,
    };
  }

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'] as String,
      type: DocumentType.values.firstWhere(
        (type) => type.name == json['type'],
        orElse: () => DocumentType.proofOfIdentity,
      ),
      name: json['name'] as String,
      fileName: json['fileName'] as String,
      status: DocumentStatus.values.firstWhere(
        (status) => status.name == json['status'],
        orElse: () => DocumentStatus.notSupplied,
      ),
      points: json['points'] as int? ?? 0,
      uploadedAt: json['uploadedAt'] != null 
          ? DateTime.parse(json['uploadedAt'] as String)
          : null,
      expiresAt: json['expiresAt'] != null 
          ? DateTime.parse(json['expiresAt'] as String)
          : null,
      isRequired: json['isRequired'] as bool? ?? true,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DocumentModel &&
        other.id == id &&
        other.type == type &&
        other.name == name &&
        other.fileName == fileName &&
        other.status == status &&
        other.points == points &&
        other.uploadedAt == uploadedAt &&
        other.expiresAt == expiresAt &&
        other.isRequired == isRequired;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        name.hashCode ^
        fileName.hashCode ^
        status.hashCode ^
        points.hashCode ^
        uploadedAt.hashCode ^
        expiresAt.hashCode ^
        isRequired.hashCode;
  }
}

extension DocumentTypeExtension on DocumentType {
  String get displayName {
    switch (this) {
      case DocumentType.proofOfIdentity:
        return 'Proof of identity';
      case DocumentType.centrelinkCard:
        return 'Centrelink card';
      case DocumentType.medicalDegree:
        return 'Medical degree';
      case DocumentType.policeCheck:
        return 'Police check';
      case DocumentType.workVisa:
        return 'Work visa (if applicable)';
      case DocumentType.medicalIndemnityInsurance:
        return 'Medical indemnity insurance';
      case DocumentType.workingWithChildrenCheck:
        return 'Working with children check (need a new one for each state you work in)';
      case DocumentType.vaccinationCertificate:
        return 'Vaccination certificate';
      case DocumentType.medicareCard:
        return 'Medicare card';
      case DocumentType.approvalForSecondaryEmployment:
        return 'Approval for secondary employment (if applicable)';
    }
  }

  int get pointsValue {
    switch (this) {
      case DocumentType.proofOfIdentity:
        return 70; // Primary document
      case DocumentType.centrelinkCard:
        return 40;
      case DocumentType.medicalDegree:
        return 0; // No points for other docs
      case DocumentType.policeCheck:
        return 0;
      case DocumentType.workVisa:
        return 0;
      case DocumentType.medicalIndemnityInsurance:
        return 0;
      case DocumentType.workingWithChildrenCheck:
        return 0;
      case DocumentType.vaccinationCertificate:
        return 0;
      case DocumentType.medicareCard:
        return 0;
      case DocumentType.approvalForSecondaryEmployment:
        return 0;
    }
  }
}

extension DocumentStatusExtension on DocumentStatus {
  String get displayName {
    switch (this) {
      case DocumentStatus.notSupplied:
        return 'Not supplied';
      case DocumentStatus.uploaded:
        return 'Uploaded';
      case DocumentStatus.pending:
        return 'Pending';
      case DocumentStatus.verified:
        return 'Verified';
      case DocumentStatus.rejected:
        return 'Rejected';
    }
  }
}
