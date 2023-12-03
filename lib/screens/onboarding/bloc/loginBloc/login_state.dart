abstract class LoginState{}

class LoginInitialState extends LoginState{}

class LoginValidState extends LoginState{}

class LoginUserErrorState extends LoginState{
  final String errorMessage;
  LoginUserErrorState(this.errorMessage);
}

class LoginPasswordErrorState extends LoginState{
  final String errorMessage;
  LoginPasswordErrorState(this.errorMessage);
}

class LoginLoadingState extends LoginState{}