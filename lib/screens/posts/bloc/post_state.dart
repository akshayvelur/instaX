part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}
class ImagePickState extends PostState{
  final File img;

  ImagePickState({required this.img});
}
class PostUploadedState extends PostState{

}
class UploadingState extends PostState{}
class UploadingCompleteState extends PostState{}