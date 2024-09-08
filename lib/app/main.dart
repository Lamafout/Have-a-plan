import 'package:flutter/material.dart';
import 'package:have_a_plan/app/screens/app/home.dart';
import 'package:have_a_plan/app/screens/auth/welcome.dart';
import 'package:have_a_plan/bloc/data_loading/data_loading_bloc.dart';
import 'package:have_a_plan/bloc/switch_page/switch_page_bloc.dart';
import 'package:have_a_plan/bloc/todo_element/todo_element_bloc.dart';
import 'package:have_a_plan/bloc/welcome_text/welcome_text_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:have_a_plan/app/screens/auth/auth.dart';
import 'package:have_a_plan/bloc/auth/auth_home.dart';
import 'package:have_a_plan/bloc/written_controller/written_controller_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'classes/user.dart';

void main() async {
  // это нужно для работы с Hive
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => DataLoadingBloc()),
        BlocProvider(create: (context) => WelcomeTextBloc()),
        BlocProvider(create: (context) => TodoElementBloc()),
        BlocProvider(create: (context) => WrittenControllerBloc()),
        BlocProvider(create: (context) => SwitchPageBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            headlineSmall: TextStyle(
              color: Colors.indigo[500]
            ),
            headlineMedium: TextStyle(
              color: Colors.indigo[900],
            )
          ),
          primaryColor: Colors.indigo.withOpacity(0.3),
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme(
              onPrimary: Colors.indigo[900] as Color,
              onSecondary: Colors.indigo[300] as Color,
              onError: Colors.red,
              onSurface: Colors.indigo[900] as Color,
              brightness: Brightness.light,
              primary: Colors.indigo[900] as Color,
              secondary: Colors.indigo[300] as Color,
              error: Colors.red,
              surface: Colors.indigo[900] as Color,

            ),
            buttonColor: Colors.indigo[900],
            highlightColor: Colors.indigo[300],
          )
        ),
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<AuthBloc>(context),
      builder: (context, state) {
        if (state is InitialState){
          print('initial');
          return WelcomeScreen();
        } else{
            WidgetsBinding.instance.addPostFrameCallback((_){
            // Проверяем, не инициирована ли уже навигация
              if (ModalRoute.of(context)?.isCurrent == true) {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) => (state is LoggedInState) ? HomeScreen() : const AuthScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(1.0, 0.0);
                      var end = Offset.zero;
                      var curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
              
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              }
            });
            return WelcomeScreen();
          }
        });
      }
}
