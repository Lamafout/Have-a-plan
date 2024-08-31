import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/classes/user.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'data_loading_event.dart';
part 'data_loading_state.dart';

class DataLoadingBloc extends Bloc<DataLoadingEvent, DataLoadingState> {
  DataLoadingBloc() : super(DataLoadingInitial()) {
    on<Loading>((event, emit) async {
      var box = await Hive.openBox('user');
      User? user = box.get('currentUser');
      if (user != null){
        if (user.isLocal){
          print('STATE: user is local');
          emit(GettedFromLocal(user: user));
        }
        else{
          print('STATE: user is not local');
          // TODO ищем пользовательские данные и возвращаем их
          try {
            // поиск данных
            emit(Loaded(loadedInfo: const <String,String>{}));
          } catch (e) {
            emit(Failure(user: user));
          }
        }
      }
      else print('STATE: user is null');
    });
  }
}
