part of '../../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataLoadingBloc>(context).add(Loading());
    print('LOADING EVENT: send is succsesful');
    return CustomScrollView(
      slivers:[
        SliverAppBar(
          actions: [
            BlocBuilder(
              bloc: BlocProvider.of<DataLoadingBloc>(context),
              builder: (context, state) {
                if (state is GettedFromLocal){
                  return const Center(child: Text('Local session'),);
                } else{
                  return const Center(child: Text('Not logged in'),);
                }
              },
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: BlocBuilder(
            bloc: BlocProvider.of<DataLoadingBloc>(context),
            builder: (context, state) {
              if (state is GettedFromLocal){
                return const Center(child: Text('Local session'),);
              } else{
                return const Center(child: Text('Some session'),);
              }
            },
          ),
        ),
      ]
    );
  }
}