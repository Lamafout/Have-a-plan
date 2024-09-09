import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/classes/note.dart';
import 'package:have_a_plan/app/classes/user.dart';
import 'package:hive/hive.dart';

part 'written_controller_event.dart';
part 'written_controller_state.dart';

class WrittenControllerBloc extends Bloc<WrittenControllerEvent, WrittenControllerState> {
  WrittenControllerBloc() : super(WrittenControllerInitial()) {
    on<CreateToDoBlockEvent>((event, emit) {
      var box = Hive.box('user');
      User user = box.get('currentUser');
      user.addPlan(event.todoBlock);
      box.put('currentUser', user);
      emit(CreatedState());
    });
  }
}
