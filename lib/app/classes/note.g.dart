// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WrittenAdapter extends TypeAdapter<Written> {
  @override
  final int typeId = 1;

  @override
  Written read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Written(
      name: fields[0] as String,
      type: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Written obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WrittenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final int typeId = 2;

  @override
  Note read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Note(
      name: fields[0] as String,
      text: fields[2] as String?,
    )..type = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ToDoBlockAdapter extends TypeAdapter<ToDoBlock> {
  @override
  final int typeId = 3;

  @override
  ToDoBlock read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoBlock(
      name: fields[0] as String,
    )..type = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, ToDoBlock obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.todoList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoBlockAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ToDoElementAdapter extends TypeAdapter<ToDoElement> {
  @override
  final int typeId = 4;

  @override
  ToDoElement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoElement(
      label: fields[1] as String,
      isCompleted: fields[2] as bool,
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, ToDoElement obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoElementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
