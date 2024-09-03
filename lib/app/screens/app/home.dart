part of '../../main.dart';

class HomeScreen extends StatelessWidget {

//TODO написать метод наполнения
  List<ToDoWidget> listOfTodos = [];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataLoadingBloc>(context).add(Loading());
    print('LOADING EVENT: send is succsesful');
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers:[
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            snap: true,
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder(
                bloc: BlocProvider.of<DataLoadingBloc>(context),
                builder: (context, state){
                  if (state is GettedFromLocal){
                    int sumOfPlans = 0;
                    var listOfBlocks = state.user.plans
                    .whereType<ToDoBlock>();
                    listOfBlocks.forEach((elem){
                      sumOfPlans += elem.todoList.length;
                    });
                    return  Text(
                      'You have $sumOfPlans plans',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    );
                  }
                  else{
                    return const Center(child: Text('Some session'),);
                  }
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                onPressed: (){},
              ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(64),
              child: Container(height: 64, width: double.infinity, color: Colors.white, child: MySearchBar())
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: 
              [],
            ),
          ),
        ],
      ),
    );
  }
}