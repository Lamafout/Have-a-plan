import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_text_event.dart';
part 'welcome_text_state.dart';

class WelcomeTextBloc extends Bloc<WelcomeTextEvent, WelcomeTextState> {
  WelcomeTextBloc() : super(WelcomeTextInitial()) {
    on<PrintEvent>((event, emit) {
      if (_counter != 'welcome'.length){
        _counter++;
        print('COUNTER IN BLOC: $_counter');
        emit(Print());
      }
      else{
        emit(StopPrint());
      }
    });
  }
  int _counter = 0;
}
