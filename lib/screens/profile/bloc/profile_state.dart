part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
class ProfilePicState extends ProfileEvent{}
  
