import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()){
    on<LogIn>((event, emit) async {
      var box = await Hive.openBox('user');
      if (box.isEmpty){
        print('STATE: logged out');
        emit(LoggedOutState());
      } //читаем пользователя в локальных данных и возвращаем состояние нужное
      else{
        print('STATE: logged in');
        emit(LoggedInState());
      }
    });
  }
}