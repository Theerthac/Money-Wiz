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
      fields[0] as int?,
      fields[1] as String,
      fields[2] as DateTime,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, add_data obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.select)
      ..writeByte(2)
      ..write(obj.dateTime)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.discription);
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
