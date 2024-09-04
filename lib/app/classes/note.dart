import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1)
class Written{
  Written({required this.name, required this.type});
  @HiveField(0)
  String name;
  @HiveField(1)
  int type;
}
@HiveType(typeId: 2)
class Note implements Written{
  Note({required this.name, this.text})
    : type = 1;
  Note.unnamed()
    :  name = 'unnamed',
       type = 1;
  @HiveField(0)
  @override
  String name;
  @HiveField(1)
  @override
  int type;
  @HiveField(2)
  String? text;

  saveText(String txt){
    text = txt;
  }
}
@HiveType(typeId: 3)
class ToDoBlock implements Written{
  ToDoBlock({required this.name})
    : type = 0;
  @HiveField(0)
  @override
  String name;
  @HiveField(1)
  @override
  int type;
  @HiveField(2)
  final todoList = <ToDoElement>[];

  addTodo(ToDoElement todo){
    todo.id = todoList.length;
    todoList.add(todo);
  }
  addAllTodo(List<ToDoElement> todos){
    todoList.addAll(todos);
  }
}
@HiveType(typeId: 4)
class ToDoElement{
  ToDoElement({required this.label, required this.isCompleted});
  ToDoElement.create({required this.label}) : isCompleted = false;
  @HiveField(0)
  int? id;
  @HiveField(1)
  String label;
  @HiveField(2)
  bool isCompleted;
}