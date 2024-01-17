abstract class LoginEvent {}

class InitLoginEvent extends LoginEvent {}

class SubmitLoginEvent extends LoginEvent {
  String username, password;

  SubmitLoginEvent(this.username, this.password);
}

class ShowHidePassLoginEvent extends LoginEvent {}
