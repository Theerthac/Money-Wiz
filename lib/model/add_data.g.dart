// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class adddataAdapter extends TypeAdapter<add_data> {
  @override
  final int typeId = 1;

  @override
  add_data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return add_data(
      select: fields[0] as String,
      dateTime: fields[1] as DateTime,
      amount: fields[2] as String,
      description: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, add_data obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.select)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is adddataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
