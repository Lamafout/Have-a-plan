part of '../../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataLoadingBloc>(context).add(Loading());
    print('LOADING EVENT: send is succsesful');
    // TODO накидать виджетов
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers:[
          SliverAppBar(
            title: BlocBuilder(
              bloc: BlocProvider.of<DataLoadingBloc>(context),
              builder: (context, state){
                if (state is GettedFromLocal){
                  int sumOfPlans = 0;
                  var listOfBlocks = state.user.plans
                  .whereType<ToDoBlock>();
                  listOfBlocks.forEach((elem){
                    sumOfPlans += elem.todoList.length;
                  });
                  return  Text('You have $sumOfPlans plans');
                }
                else{
                  return const Center(child: Text('Some session'),);
                }
              },
            ),
            actions: [
              BlocBuilder(
                bloc: BlocProvider.of<DataLoadingBloc>(context),
                builder: (context, state) {
                  if (state is GettedFromLocal || state is Failure){
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
                if (state is GettedFromLocal || state is Failure){
                  return const Center(child: Text('Local session'),);
                } else{
                  return const Center(child: Text('Some session'),);
                }
              },
            ),
          ),
        ]
      ),
    );
  }
}