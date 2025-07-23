import 'package:cloud_firestore/cloud_firestore.dart';

class PublicPost{
  final String caption;
  final Timestamp createdAt;
  final String img;
  final String uid;
  final String username;
final String ProfilePic ;
  

  PublicPost({required this.caption, required this.createdAt, required this.img, required this.uid, required this.username,required this.ProfilePic});
factory PublicPost.fromMap(Map<String,dynamic>map){
  return PublicPost(caption: map ["caption"]??"", createdAt: map["createdAt"], img: map["img"]??"", uid: map["uid"]??"", username: map["username"]??"",ProfilePic: map['profilePic']??"");
}

}
