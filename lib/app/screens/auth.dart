import 'package:flutter/material.dart';
import 'package:have_a_plan/res/widgets/auth_button.dart';

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
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'let\'s',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 60,
                      ),
                    ),
                    Text(
                      'get to work!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 60,
                      )
                    ),
                  ],
                ),
                AuthButton(color: Colors.blue, text: 'Touch me'),
              ]
            ),
          )
        ],
      ),
    );
  }
}