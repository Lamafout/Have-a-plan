import 'dart:ui';

import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Container(
              width: 300,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.3),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 15),
                child: TextField(
                  
                  cursorColor: Colors.black,
                  controller: _controller,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  // expands: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  
                ),
              )
            ),
          ),
          const SizedBox(width: 5,),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Container(
              color: Colors.indigo.withOpacity(0.3),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
                    size: 30,
                  ),
                  //TODO добавить поисковой функционал
                  onPressed: (){},
                ),
              ),
            ),
          )
        ],
      
      ),
    );
  }
}