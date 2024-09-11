import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/classes/note.dart';
import 'package:have_a_plan/bloc/todo_element/todo_element_bloc.dart';
import 'package:have_a_plan/res/widgets/todo_widget.dart';

class ToDoBlockWidget extends StatelessWidget {
  const ToDoBlockWidget({required this.todoBlock, super.key});
  final ToDoBlock todoBlock;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 3
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (todoBlock.name == '') 
            ? Container() 
            : Text(
                todoBlock.name,
                style: TextStyle(
                  color: Theme.of(context).textTheme.headlineMedium?.color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: RawMaterialButton(
                  elevation: 0,
                  fillColor: Theme.of(context).primaryColor.withOpacity(0.3),
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusElevation: 0,
                  highlightElevation: 0,
                  hoverElevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  onPressed: (){
                    var todo = ToDoElement.create(label: '', parrentId: todoBlock.index as int);
                    BlocProvider.of<TodoElementBloc>(context).add(Create(todo: todo));
                  },
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
                    child: Icon(Icons.add, color: Theme.of(context).buttonTheme.colorScheme?.onPrimary,)
                  ),
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder(
                bloc: BlocProvider.of<TodoElementBloc>(context),
                builder: (context, state){
                  return Column(children: [...todoBlock.todoList.map((elem)=>ToDoWidget(todo: elem))]);
                }
              ),
              
          ],
        ),
      ),
    );
  }
}