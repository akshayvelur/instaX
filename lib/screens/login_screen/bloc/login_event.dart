part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
class SignInAccountEvent extends LoginEvent{
  final String email;
  final String password ;

  SignInAccountEvent({required this.email, required this.password});
}
class NavigateToCreateEvent extends LoginEvent{

}
class CreateAccoutEvent extends LoginEvent{
  final String userName;
  final String email;
  final String password ;
  CreateAccoutEvent({required this.userName,required this.email, required this.password});
}

