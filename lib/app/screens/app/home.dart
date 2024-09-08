import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/classes/note.dart';
import 'package:have_a_plan/bloc/data_loading/data_loading_bloc.dart';
import 'package:have_a_plan/bloc/switch_page/switch_page_bloc.dart';
import 'package:have_a_plan/bloc/written_controller/written_controller_bloc.dart';
import 'package:have_a_plan/res/widgets/search_bar.dart';
part 'new_note_page.dart';

class HomeScreen extends StatelessWidget {
//TODO написать метод наполнения
  int _currentNavidationIndex = 1;
  List<Widget> pages = [
    NewNotePage(),
    Column(),
    Column(),
  ];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataLoadingBloc>(context).add(Loading());
    print('LOADING EVENT: send is succsesful');
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
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
                  builder: (context, state) {
                    if (state is GettedFromLocal) {
                      int sumOfPlans = 0;
                      var listOfBlocks =
                          state.user.plans.whereType<ToDoBlock>();
                      listOfBlocks.forEach((elem) {
                        sumOfPlans += elem.todoList.length;
                      });
                      return Text(
                        'You have $sumOfPlans plans',
                        style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.color as Color,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text('Some session'),
                      );
                    }
                  },
                ),
                Row(
                  children: [
                    // TODO сделать логику для синхронизации
                    IconButton(
                      icon: Icon(
                        Icons.cloud_sync_rounded,
                        size: 30,
                        color:
                            Theme.of(context).buttonTheme.colorScheme?.primary,
                      ),
                      onPressed: () {},
                    ),
                    //TODO сделать логику для просмотра профиля
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        size: 30,
                        color:
                            Theme.of(context).buttonTheme.colorScheme?.primary,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(64),
                child: Container(
                    height: 64,
                    width: double.infinity,
                    color: Colors.white,
                    child: MySearchBar())),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder(
                bloc: BlocProvider.of<SwitchPageBloc>(context),
                builder: (context, state) {
                  return pages[_currentNavidationIndex];
                }),
          ),
        ],
      ),
      //TODO сделать перелкючение экранов. в первую очередь на экран создания нового виджета
      bottomNavigationBar: 
      BlocBuilder<SwitchPageBloc, SwitchPageState>(
        builder: (context, state) {
          return 
          BottomNavigationBar(
            onTap: (index) {
              _currentNavidationIndex = index;
              print('SEND SWITCH EVENT');
              BlocProvider.of<SwitchPageBloc>(context)
                  .add(SwitchPage(index: index));
            },
            currentIndex: _currentNavidationIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle),
                label: 'New',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_sharp),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }
}
