import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/res/assets/auth_background.jpg'),
                  fit: BoxFit.cover,
                )
              ) 
          ),
        ],
      ),
    );
  }
}