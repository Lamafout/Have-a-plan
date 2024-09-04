class Written{
  Written({required this.name, required this.type});
  String name;
  int type;
}

class Note implements Written{
  Note({required this.name, this.text})
    : type = 1;
  Note.unnamed()
    :  name = 'unnamed',
       type = 1;
  @override
  String name;
  @override
  int type;
  String? text;

  saveText(String txt){
    text = txt;
  }
}

class ToDoBlock implements Written{
  ToDoBlock({required this.name})
    : type = 0;
  @override
  String name;
  @override
  int type;
  final todoList = <ToDoElement>[];

  addTodo(ToDoElement todo){
    todoList.add(todo);
  }
  addAllTodo(List<ToDoElement> todos){
    todoList.addAll(todos);
  }
}
//TODO гений на Амале решил не делать индексы, поэтому их надо добавить и сделать заново user.g.dart
class ToDoElement{
  ToDoElement({required this.label, required this.isCompleted});
  ToDoElement.create({required this.label}) : isCompleted = false;
  String label;
  bool isCompleted;
}