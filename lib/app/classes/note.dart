class Written{
  Written({required this.name, required this.type});
  String name;
  int type;
}

class Note implements Written{
  Note({required this.name, required this.type, this.text});
  Note.unnamed({required this.type})
    :  name = 'unnamed';
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
  ToDoBlock({required this.name, required this.type});
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

class ToDoElement{
  ToDoElement({required this.label, required this.isCompleted});
  ToDoElement.create({required this.label}) : isCompleted = false;
  String label;
  bool isCompleted;
}