part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
class CreateAccountState extends LoginState{
}
class Loadingstate extends LoginState{}
class EmailOrPasswordErrorState extends LoginState{
 final String erroring;

  EmailOrPasswordErrorState({required this.erroring});
}
class LoginAccountState extends LoginState{
}
class NavigateTocreateState extends LoginState{

}
class AccountLoadingState extends LoginState{

}
class AccountCreatedAlertState extends LoginState{
  final String erroring;

  AccountCreatedAlertState({required this.erroring});
}
class AccountCreatedState extends LoginState{

}