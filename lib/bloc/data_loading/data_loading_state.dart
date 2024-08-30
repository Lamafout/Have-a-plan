part of 'data_loading_bloc.dart';

@immutable
sealed class DataLoadingState {}

final class DataLoadingInitial extends DataLoadingState {}
class GettedFromLocal extends DataLoadingState{}
class Loaded extends DataLoadingState{
  Loaded({required this.loadedInfo});
  var loadedInfo = Map<String, String>;
}
class Failure extends DataLoadingState{}
