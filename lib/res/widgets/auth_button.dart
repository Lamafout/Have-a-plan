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
    return FilledButton(
      onPressed: _onPressed, 
      child: Text(
        text,
        style: TextStyle(
          color: _textColor,
        ),
      )
    );
  }
}