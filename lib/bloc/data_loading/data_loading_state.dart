part of 'data_loading_bloc.dart';

@immutable
sealed class DataLoadingState {}

final class DataLoadingInitial extends DataLoadingState {}
class GettedFromLocal extends DataLoadingState{
  GettedFromLocal({required this.user});
  final User user;
}
class Loaded extends DataLoadingState{
  Loaded({required this.loadedInfo});
  var loadedInfo = <String, String>{};
}
class Failure extends DataLoadingState{
  Failure({required this.user});
  final User user;
}
