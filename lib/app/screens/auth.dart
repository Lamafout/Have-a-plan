import 'package:flutter/material.dart';
import 'package:have_a_plan/app/main.dart';
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
                AuthButton(color: Colors.black, text: 'Sign up'),
                const SizedBox(height: 10,),
                AuthButton(color: Colors.white, text: 'Sign in', textColor: Colors.black,),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: (){
                    // TODO после добавления локального хранилища надо будет создать нового пользователя в локалке
                    // чтобы при переходе на Home мы зашли в приложение
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  }, 
                  child: const Text('skip this step', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black54))
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}