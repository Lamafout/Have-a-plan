part of 'data_loading_bloc.dart';

@immutable
sealed class DataLoadingEvent {}

class Loading extends DataLoadingEvent{}