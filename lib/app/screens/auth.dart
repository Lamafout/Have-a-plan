import 'package:flutter/material.dart';
import 'package:have_a_plan/app/main.dart';
import 'package:have_a_plan/res/widgets/auth_button.dart';
import '../classes/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  // TODO добавить функционал для создания локального пользователя
  _createLocalUser() async{
    var box = await Hive.openBox('user');
    box.add(User.local(username: 'user'));
  }

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
          SizedBox(
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        _createLocalUser();
                        return Home();
                      }));
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