import 'package:flutter/material.dart';
import 'package:have_a_plan/app/classes/note.dart';
import 'package:have_a_plan/res/widgets/todo_widget.dart';

class ToDoBlockWidget extends StatelessWidget {
  const ToDoBlockWidget({required this.todoBlock, super.key});
  final ToDoBlock todoBlock;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('test'),
          //TODO протестить
          ...todoBlock.todoList.map((elem)=>ToDoWidget(todo: elem))
        ],
      ),
    );
  }
}