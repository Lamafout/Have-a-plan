import 'dart:ui';

import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Color color;
  final String text;
  late VoidCallback _onPressed;
  late Color _textColor;
  AuthButton({required this.color, required this.text, textColor, onPressed}){
    _onPressed = onPressed ?? (){};
    _textColor =textColor ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color.withOpacity(0.7),
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 13)
          ),
          onPressed: _onPressed, 
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Text(
              text,
              style: TextStyle(
                color: _textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ),
      ),
    );
  }
}