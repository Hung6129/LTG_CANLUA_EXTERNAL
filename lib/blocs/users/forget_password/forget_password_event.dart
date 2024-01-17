abstract class ForgetPasswordEvent {}

class InitEvent extends ForgetPasswordEvent {}

class ShowPass1ForgetPasswordEvent extends ForgetPasswordEvent {}

class ShowPass2ForgetPasswordEvent extends ForgetPasswordEvent {}

class SubmitForgetPasswordEvent extends ForgetPasswordEvent {
  final String phone, pass;
  SubmitForgetPasswordEvent({
    required this.phone,
    required this.pass,
  });
}
