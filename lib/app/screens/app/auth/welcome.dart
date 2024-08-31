import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/main.dart';
import 'package:have_a_plan/bloc/auth/auth_home.dart';
import 'package:have_a_plan/bloc/data_loading/data_loading_bloc.dart';
import 'package:have_a_plan/bloc/welcome_text/welcome_text_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen() : _text = 'welcome'.split(''), _tempText = [];
  final List<String> _tempText;
  final List<String> _text;

  int _index = 0;

  _changeLetter(){
    _tempText.add(_text[_index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: BlocBuilder(
          bloc: BlocProvider.of<WelcomeTextBloc>(context),
          builder: (context, state){
            if (state is WelcomeTextInitial){
              BlocProvider.of<WelcomeTextBloc>(context).add(PrintEvent());
            } else if (state is Print){
              print('PRINTED $_index');
              _changeLetter;
              _index++;
              BlocProvider.of<WelcomeTextBloc>(context).add(PrintEvent());
            } else if (state is StopPrint){
              Future((){BlocProvider.of<AuthBloc>(context).add(LogIn());})
              .then((value) {
                return Home();
              },);
              print('STOP PRINT');
            }
            return Text(
                _tempText.join(''),
                style: const TextStyle(
                  color: Colors.black
                ),
              );
          }
          )
      ),

    );
  }
}