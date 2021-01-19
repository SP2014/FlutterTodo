// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_h.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodosHAdapter extends TypeAdapter<TodosH> {
  @override
  TodosH read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodosH(
      id: fields[0] as int,
      task: fields[1] as String,
      category: fields[2] as String,
      timestamp: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TodosH obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.task)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.timestamp);
  }
}
