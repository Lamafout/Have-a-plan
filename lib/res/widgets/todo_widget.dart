import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/classes/note.dart';
import 'package:have_a_plan/bloc/todo_element/todo_element_bloc.dart';

class ToDoWidget extends StatelessWidget {
  const ToDoWidget({required this.todo});
  final ToDoElement todo;

  _onPressed(BuildContext context){
    BlocProvider.of<TodoElementBloc>(context).add(ToDoElementToggled(todo: todo));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: Text(
              todo.label,
              style: TextStyle(
                color: Theme.of(context).textTheme.headlineMedium?.color,
              ),
            ),
          ),
          BlocBuilder<TodoElementBloc, TodoElementState>(
            builder: (context, state) {

              return Container(
                //TODO доделать дезигн
                decoration: BoxDecoration(
                  color: todo.isCompleted
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).buttonTheme.colorScheme?.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: todo.isCompleted ? null : Border.all(color: Theme.of(context).buttonTheme.colorScheme?.secondary as Color, width: 5),
                ),
                child: IconButton(
                  icon: todo.isCompleted 
                    ? Icon(Icons.close_rounded, size: 30, color: Theme.of(context).buttonTheme.colorScheme?.primary)
                    : const Icon(null),
                  onPressed: () {
                    _onPressed(context);
                  }
                ),
              );
            }
          )
        ],
      )
    );
  }
}
