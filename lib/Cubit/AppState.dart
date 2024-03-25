abstract class AppState{}
class AuthInitial extends AppState{}
class LogInLoading extends AppState{}
class LogInSuccess extends AppState{}
class LogInFailure extends AppState{
  String errorMessage;
  LogInFailure({required this.errorMessage});
}


class RegisterLoading extends AppState{}
class RegisterSuccess extends AppState{}
class RegisterFailure extends AppState{
  String errorMessage;
  RegisterFailure({required this.errorMessage});
}



