import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Written {
  Written({required this.index, required this.name, required this.type});

  @HiveField(0)
  int? index;

  @HiveField(1)
  String name;

  @HiveField(2)
  int type;
}

@HiveType(typeId: 2)
class Note implements Written {
  Note({required this.index, required this.name, this.text})
      : type = 1;

  Note.unnamed()
      : name = 'unnamed',
        type = 1,
        index = null,
        text = null;

  @HiveField(0)
  @override
  int? index;

  @HiveField(1)
  @override
  String name;

  @HiveField(2)
  @override
  int type;

  @HiveField(3)
  String? text;

  void saveText(String txt) {
    text = txt;
  }
}

@HiveType(typeId: 3)
class ToDoBlock implements Written {
  ToDoBlock({this.index, required this.name, this.todoList = const [], this.type = 0});

  @HiveField(0)
  @override
  int? index;

  @HiveField(1)
  @override
  String name;

  @HiveField(2)
  @override
  int type;

  @HiveField(3)
  List<ToDoElement> todoList;

  void addTodo(ToDoElement todo) {
    todo.id = todoList.length;
    todoList.add(todo);
  }

  void addAllTodo(List<ToDoElement> todos) {
    todoList.addAll(todos);
  }
}

@HiveType(typeId: 4)
class ToDoElement {
  ToDoElement({this.id, required this.label, required this.isCompleted, required this.parrentId});

  ToDoElement.create({required this.label, required this.parrentId}) : isCompleted = false, id = null;

  @HiveField(0)
  int? id;

  @HiveField(1)
  String label;

  @HiveField(2)
  bool isCompleted;

  @HiveField(3)
  int parrentId;
}
