// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'references_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReferencesVOAdapter extends TypeAdapter<ReferencesVO> {
  @override
  final int typeId = 3;

  @override
  ReferencesVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReferencesVO(
      verifiedCode: fields[0] as String,
      seq: fields[1] as int,
      fullName: fields[2] as String,
      mobile: fields[3] as String,
      email: fields[4] as String,
      specialty: fields[5] as String,
      seniority: fields[6] as String,
      hospitalCurrent: fields[7] as String,
      verifiedTime: fields[8] as int,
      dueTime: fields[9] as int,
      verifiedUrl: fields[10] as String,
      verifiedUrlExt: fields[11] as String,
      createTime: fields[12] as int,
      updatedTime: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ReferencesVO obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.verifiedCode)
      ..writeByte(1)
      ..write(obj.seq)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.mobile)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.specialty)
      ..writeByte(6)
      ..write(obj.seniority)
      ..writeByte(7)
      ..write(obj.hospitalCurrent)
      ..writeByte(8)
      ..write(obj.verifiedTime)
      ..writeByte(9)
      ..write(obj.dueTime)
      ..writeByte(10)
      ..write(obj.verifiedUrl)
      ..writeByte(11)
      ..write(obj.verifiedUrlExt)
      ..writeByte(12)
      ..write(obj.createTime)
      ..writeByte(13)
      ..write(obj.updatedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReferencesVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
