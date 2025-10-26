// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoVOAdapter extends TypeAdapter<UserInfoVO> {
  @override
  final int typeId = 1;

  @override
  UserInfoVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfoVO(
      mobileNumber: fields[0] as String,
      email: fields[1] as String,
      firstName: fields[2] as String,
      surname: fields[3] as String,
      profilePic: fields[4] as String,
      disabledTime: fields[5] as int?,
      deletedTime: fields[6] as int?,
      createTime: fields[7] as int?,
      completedShifts: fields[8] as int,
      favouritesFlag: fields[9] as bool?,
      phoneCode: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserInfoVO obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.mobileNumber)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.surname)
      ..writeByte(4)
      ..write(obj.profilePic)
      ..writeByte(5)
      ..write(obj.disabledTime)
      ..writeByte(6)
      ..write(obj.deletedTime)
      ..writeByte(7)
      ..write(obj.createTime)
      ..writeByte(8)
      ..write(obj.completedShifts)
      ..writeByte(9)
      ..write(obj.favouritesFlag)
      ..writeByte(10)
      ..write(obj.phoneCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
