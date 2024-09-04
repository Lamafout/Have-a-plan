import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/classes/note.dart';

part 'todo_element_event.dart';
part 'todo_element_state.dart';

class TodoElementBloc extends Bloc<TodoElementEvent, TodoElementState> {
  TodoElementBloc() : super(TodoElementInitial()) {
    on<ToDoElementToggled>((event, emit) {
      event.todo.isCompleted = !event.todo.isCompleted;
      emit(ToDoChanged());
    });
  }
}
