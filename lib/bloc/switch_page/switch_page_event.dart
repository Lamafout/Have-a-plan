part of 'switch_page_bloc.dart';

class SwitchPageEvent {
}
class SwitchPage extends SwitchPageEvent{
  SwitchPage({required this.index});
  final int index;
}
