part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}
class LoadingState extends SplashState{
  
}
class AlreadyloggedState extends SplashState{
  
}