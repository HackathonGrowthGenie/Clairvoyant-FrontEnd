abstract class LoginEvent{}


class LoginPassChangedEvent extends LoginEvent{
  final String passwordValue;
  LoginPassChangedEvent(this.passwordValue);
}

class LoginUserChangedEvent extends LoginEvent{
  final String usernameValue;
  LoginUserChangedEvent(this.usernameValue);
}

class LoginSubmittedEvent extends LoginEvent{
  final String username;
  final String password;
  LoginSubmittedEvent(this.username, this.password);
}