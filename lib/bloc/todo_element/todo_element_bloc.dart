import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/classes/note.dart';
import 'package:hive/hive.dart';

part 'todo_element_event.dart';
part 'todo_element_state.dart';

class TodoElementBloc extends Bloc<TodoElementEvent, TodoElementState> {
  TodoElementBloc() : super(TodoElementInitial()) {
    var box = Hive.box('user');
    on<Update>((event, emit) {
      // change flag
      event.todo.isCompleted = !event.todo.isCompleted;
      // update in local storage
      var plans = box.get('currentUser');
      var todoBlock = plans[event.todo.parrentId];
      todoBlock[event.todo.id] = event.todo;
      // send state
      emit(Updated());
    });
  }
}
