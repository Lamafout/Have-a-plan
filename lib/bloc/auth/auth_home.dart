import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()){
    on<LogIn>((event, emit) async {
      var box = await Hive.openBox('user');
      if (box.isEmpty){
        emit(LoggedOutState());
      } //читаем пользователя в локальных данных и возвращаем состояние нужное
      else{
        emit(LoggedInState());
      }
    });

    // on<Loading>((event, emit) {
    //   // TODO ищем пользовательские данные и возвращаем их
    //   try {
    //     // поиск данных
    //     emit(Loaded(loadedInfo: loadedInfo));
    //   } catch (e) {
    //     emit(Failure());
    //   }
    // });
  }
}