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
      index: fields[0] as int?,
      name: fields[1] as String,
      type: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Written obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
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
      index: fields[0] as int?,
      name: fields[1] as String,
      text: fields[3] as String?,
    )..type = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
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
      index: fields[0] as int?,
      name: fields[1] as String,
      todoList: (fields[3] as List).cast<ToDoElement>(),
      type: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoBlock obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
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
      id: fields[0] as int?,
      label: fields[1] as String,
      isCompleted: fields[2] as bool,
      parrentId: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoElement obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.isCompleted)
      ..writeByte(3)
      ..write(obj.parrentId);
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
