part of 'auth_home.dart';
class AuthState{}

class InitialState extends AuthState{}
class LoggedInState extends AuthState{}
class LoggedOutState extends AuthState{}
class GettedFromLocal extends AuthState{}
class Loaded extends AuthState{
  Loaded({required this.loadedInfo});
  var loadedInfo = Map<String, String>;
}
class Failure extends AuthState{}
