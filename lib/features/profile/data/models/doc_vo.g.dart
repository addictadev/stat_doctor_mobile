// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DocVOAdapter extends TypeAdapter<DocVO> {
  @override
  final int typeId = 4;

  @override
  DocVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DocVO(
      primaryDocumentExt: fields[0] as String,
      otherDocumentExt: fields[1] as String,
      threeDocumentExt: fields[2] as String,
      primaryDocument: fields[3] as String,
      otherDocument: fields[4] as String,
      threeDocument: fields[5] as String,
      policeCheck: fields[6] as String,
      workVisa: fields[7] as String,
      criminalHistoryCheck: fields[8] as String,
      workingWithChildrenCheck: fields[9] as String,
      vaccinationCertificate: fields[10] as String,
      medicareCard: fields[11] as String,
      approvalForSecondaryEmployment: fields[12] as String,
      policeCheckExt: fields[13] as String,
      workVisaExt: fields[14] as String,
      criminalHistoryCheckExt: fields[15] as String,
      workingWithChildrenCheckExt: fields[16] as String,
      vaccinationCertificateExt: fields[17] as String,
      medicareCardExt: fields[18] as String,
      approvalForSecondaryEmploymentExt: fields[19] as String,
      referral: fields[20] as String,
      referralExt: fields[21] as String?,
      medicalDegree: fields[22] as String,
      medicalDegreeExt: fields[23] as String,
      createTime: fields[24] as int,
      updatedTime: fields[25] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DocVO obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.primaryDocumentExt)
      ..writeByte(1)
      ..write(obj.otherDocumentExt)
      ..writeByte(2)
      ..write(obj.threeDocumentExt)
      ..writeByte(3)
      ..write(obj.primaryDocument)
      ..writeByte(4)
      ..write(obj.otherDocument)
      ..writeByte(5)
      ..write(obj.threeDocument)
      ..writeByte(6)
      ..write(obj.policeCheck)
      ..writeByte(7)
      ..write(obj.workVisa)
      ..writeByte(8)
      ..write(obj.criminalHistoryCheck)
      ..writeByte(9)
      ..write(obj.workingWithChildrenCheck)
      ..writeByte(10)
      ..write(obj.vaccinationCertificate)
      ..writeByte(11)
      ..write(obj.medicareCard)
      ..writeByte(12)
      ..write(obj.approvalForSecondaryEmployment)
      ..writeByte(13)
      ..write(obj.policeCheckExt)
      ..writeByte(14)
      ..write(obj.workVisaExt)
      ..writeByte(15)
      ..write(obj.criminalHistoryCheckExt)
      ..writeByte(16)
      ..write(obj.workingWithChildrenCheckExt)
      ..writeByte(17)
      ..write(obj.vaccinationCertificateExt)
      ..writeByte(18)
      ..write(obj.medicareCardExt)
      ..writeByte(19)
      ..write(obj.approvalForSecondaryEmploymentExt)
      ..writeByte(20)
      ..write(obj.referral)
      ..writeByte(21)
      ..write(obj.referralExt)
      ..writeByte(22)
      ..write(obj.medicalDegree)
      ..writeByte(23)
      ..write(obj.medicalDegreeExt)
      ..writeByte(24)
      ..write(obj.createTime)
      ..writeByte(25)
      ..write(obj.updatedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DocVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
