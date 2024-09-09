import 'package:flutter_bloc/flutter_bloc.dart';

part 'switch_page_event.dart';
part 'switch_page_state.dart';

class SwitchPageBloc extends Bloc<SwitchPageEvent, SwitchPageState> {
  SwitchPageBloc() : super(SwitchPageInitial()) {
    on<SwitchPageEvent>((event, emit) {
      emit(Switched());
    });
  }
}
