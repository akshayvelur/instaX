part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}
class ImagePickEvent extends PostEvent{}
class PostingEvent extends PostEvent{
final File img;
final String caption;

  PostingEvent({required this.img, required this.caption});
}