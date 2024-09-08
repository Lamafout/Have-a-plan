part of 'home.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.plans, super.key});
  final List<Written> plans;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WrittenControllerBloc, WrittenControllerState>(
      builder: (context, state) {
        return Column(
          children: [
            ...plans.map((elem) {
              return elem.type == 0
                  ? ToDoBlockWidget(todoBlock: elem as ToDoBlock)
                  : Container();
            })
          ],
        );
      },
    );
  }
}
