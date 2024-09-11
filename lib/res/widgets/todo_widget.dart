import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/classes/note.dart';
import 'package:have_a_plan/bloc/todo_element/todo_element_bloc.dart';

class ToDoWidget extends StatelessWidget {
  ToDoWidget({required this.todo, super.key});
  final ToDoElement todo;

  _onPressed(BuildContext context) {
    BlocProvider.of<TodoElementBloc>(context)
        .add(Toggle(todo: todo));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: BlocBuilder<TodoElementBloc, TodoElementState>(
                  builder: (context, state) {
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    // border: Border.all(color: Theme.of(context).buttonTheme.colorScheme?.secondary as Color, width: 3),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: IconButton(
                        icon: todo.isCompleted
                            ? Icon(Icons.check,
                                size: 32,
                                color: Theme.of(context)
                                    .buttonTheme
                                    .colorScheme
                                    ?.primary)
                            : const Icon(null),
                        onPressed: () {
                          _onPressed(context);
                        }),
                  ),
                );
              }),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
                    child: BlocBuilder(
                      bloc: BlocProvider.of<TodoElementBloc>(context),
                      builder: (context, state) {
                        return TextFormField(
                          initialValue: todo.label,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: todo.isCompleted
                            ? Theme.of(context).textTheme.headlineSmall?.color
                            : Theme.of(context).textTheme.headlineMedium?.color,
                            decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                          ),
                          onChanged: (value) {
                            todo.label = value;
                          },
                          onEditingComplete: (){
                            BlocProvider.of<TodoElementBloc>(context).add(Update(todo: todo));
                          },
                          onTapOutside: (event) {
                            BlocProvider.of<TodoElementBloc>(context).add(Update(todo: todo));
                            FocusScope.of(context).unfocus();
                          },
                          
                        );
                        // return Text(
                        //   todo.label,
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 16,
                        //     color: todo.isCompleted
                        //     ? Theme.of(context).textTheme.headlineSmall?.color
                        //     : Theme.of(context).textTheme.headlineMedium?.color,
                        //     decoration: todo.isCompleted
                        //     ? TextDecoration.lineThrough
                        //     : null,
                        //   ),
                        // );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
