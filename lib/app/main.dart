import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/bloc/auth_home.dart';
 void main(){
  runApp(const App());
 }

 class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  final AuthBloc _authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _authBloc,
      builder: (context, state) {
        if (state is LoggedOutState){
          return AuthSceen();
        }
        else return HomeScreen();
      },

    );
  }
}