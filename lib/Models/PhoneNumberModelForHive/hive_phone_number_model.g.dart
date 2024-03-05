// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_phone_number_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class hivePhoneNumberModel extends TypeAdapter<PhoneNumberModelForHive> {
  @override
  final int typeId = 3;

  @override
  PhoneNumberModelForHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhoneNumberModelForHive(
      avatar: fields[0] as String,
      userId: fields[2] as String,
      contact: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PhoneNumberModelForHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.avatar)
      ..writeByte(1)
      ..write(obj.contact)
      ..writeByte(2)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is hivePhoneNumberModel &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
