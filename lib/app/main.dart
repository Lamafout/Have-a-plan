import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/screens/auth.dart';
import 'package:have_a_plan/bloc/auth/auth_home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'classes/user.dart';
part 'screens/app/home.dart';
 void main() async{
  // это нужно для работы с Hive
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  runApp(const App());
 }

 class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  
  checkFromBox() async {
    final box = await Hive.openBox('user');
    if (box.isNotEmpty) {
      return const HomeScreen();
    }
    return const AuthScreen();

  }

  @override
  Widget build(BuildContext context) {
    // return AuthScreen();
    return BlocBuilder(
      bloc: authBloc,
      builder: (context, state) {
        if (state is LoggedOutState){
          return const AuthScreen();
        }
        else {
          return const Scaffold();
        }
      },

    );
  }
}