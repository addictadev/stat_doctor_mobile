// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicalVOAdapter extends TypeAdapter<MedicalVO> {
  @override
  final int typeId = 2;

  @override
  MedicalVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicalVO(
      medicalDegree: fields[0] as String,
      skillLevel: fields[1] as String,
      specialties: fields[2] as String,
      ahpraNumber: fields[3] as String,
      ahpraLicense: fields[4] as String,
      ahpraLicenseFlag: fields[5] as bool,
      abn: fields[6] as String,
      shortWork: fields[7] as String,
      resumeFileName: fields[8] as String,
      resumeFileUrl: fields[9] as String,
      createTime: fields[10] as int,
      updatedTime: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MedicalVO obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.medicalDegree)
      ..writeByte(1)
      ..write(obj.skillLevel)
      ..writeByte(2)
      ..write(obj.specialties)
      ..writeByte(3)
      ..write(obj.ahpraNumber)
      ..writeByte(4)
      ..write(obj.ahpraLicense)
      ..writeByte(5)
      ..write(obj.ahpraLicenseFlag)
      ..writeByte(6)
      ..write(obj.abn)
      ..writeByte(7)
      ..write(obj.shortWork)
      ..writeByte(8)
      ..write(obj.resumeFileName)
      ..writeByte(9)
      ..write(obj.resumeFileUrl)
      ..writeByte(10)
      ..write(obj.createTime)
      ..writeByte(11)
      ..write(obj.updatedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicalVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
