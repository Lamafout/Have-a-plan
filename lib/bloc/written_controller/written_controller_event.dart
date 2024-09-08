part of 'written_controller_bloc.dart';

class WrittenControllerEvent {}
class CreateToDoBlockEvent extends WrittenControllerEvent {
  CreateToDoBlockEvent({required this.todoBlock});
  final ToDoBlock todoBlock;
}