part of 'todo_element_bloc.dart';

class TodoElementEvent {}
class ToDoElementToggled extends TodoElementEvent {
  ToDoElementToggled({required this.todo});
  final ToDoElement todo;
}
