import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/classes/note.dart';
import 'package:have_a_plan/app/classes/user.dart';
import 'package:hive/hive.dart';

part 'todo_element_event.dart';
part 'todo_element_state.dart';

class TodoElementBloc extends Bloc<TodoElementEvent, TodoElementState> {
  TodoElementBloc() : super(TodoElementInitial()) {
    on<Toggle>((event, emit) {
      var box = Hive.box('user');
      // change flag
      event.todo.isCompleted = !event.todo.isCompleted;
      // update in local storage
      User user = box.get('currentUser');
      var parrentTodo = user.plans[event.todo.parrentId] as ToDoBlock;
      parrentTodo.todoList[event.todo.id as int] = event.todo;
      user.plans[event.todo.parrentId] = parrentTodo;
      // save into box
      box.put('currentUser', user);
      // send state
      emit(Toggled());
    });
    on<Create>((event, emit) async {
      var box = Hive.box('user');
      User user = box.get('currentUser');
      var parrentTodo = user.plans[event.todo.parrentId] as ToDoBlock;
      parrentTodo.addTodo(event.todo);
      user.plans[event.todo.parrentId] = parrentTodo;
      // save into box
      await box.put('currentUser', user);
      // send state
      emit(Created());
    });
  }
}
