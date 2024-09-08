import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:have_a_plan/app/classes/note.dart';
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
                  //TODO сделать функционал добавления тудушки к блоку
                  onPressed: (){},
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
                    child: const Icon(Icons.add)
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ...todoBlock.todoList.map((elem)=>ToDoWidget(todo: elem))
          ],
        ),
      ),
    );
  }
}