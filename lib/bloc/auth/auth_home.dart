import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialState()){
    // on<LogIn>((event, emit) async {
    //   if (){} //читаем пользователя в локальных данных и возвращаем состояние нужное
    //   else{}
    // });

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