import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/screens/auth.dart';
import 'package:have_a_plan/bloc/auth/auth_home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'classes/user.dart';
part 'screens/app/home.dart';

void main() async {
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
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(LogIn());
    return BlocBuilder(
      bloc: BlocProvider.of<AuthBloc>(context),
      builder: (context, state) {
        if (state is LoggedOutState) {
          return const AuthScreen();
        } else if (state is LoggedInState){
          return const HomeScreen();
        } else {
          return const Center(
            child: Text('Error', style: TextStyle(color: Colors.red),),
          );
        }
      },
    );
  }
}
