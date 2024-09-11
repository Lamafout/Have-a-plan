part of 'todo_element_bloc.dart';

class TodoElementEvent {}
class Toggle extends TodoElementEvent {
  Toggle({required this.todo});
  final ToDoElement todo;
}
class Create extends TodoElementEvent {
  Create({required this.todo});
  final ToDoElement todo;
}
class Update extends TodoElementEvent {
  Update({required this.todo});
  final ToDoElement todo;
}
class Delete extends TodoElementEvent {}