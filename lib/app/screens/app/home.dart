part of '../../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers:[
        SliverAppBar(
          actions: [
            BlocBuilder(
              bloc: BlocProvider.of<AuthBloc>(context),
              builder: (context, state) {
                if (state is Loaded){
                  // return Text('${state.loadedInfo['count_of_goals']} goals'); TODO раскомментить, когда будет бд наконец-то
                  return Text('hola');
                } else return Text('salam');
              },
            )
          ],
        )
      ]
    );
  }
}