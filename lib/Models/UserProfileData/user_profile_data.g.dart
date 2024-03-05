// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class userProfileDataHive extends TypeAdapter<UserProfileDataHive> {
  @override
  final int typeId = 2;

  @override
  UserProfileDataHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfileDataHive(
      username: fields[3] as String,
      phoneNumber: fields[2] as String,
      avatar: fields[1] as String,
      userId: fields[0] as String,
      info: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfileDataHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.avatar)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.info);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is userProfileDataHive &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
