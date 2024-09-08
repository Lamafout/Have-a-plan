part of 'todo_element_bloc.dart';

class TodoElementEvent {}
class Update extends TodoElementEvent {
  Update({required this.todo});
  final ToDoElement todo;
}
