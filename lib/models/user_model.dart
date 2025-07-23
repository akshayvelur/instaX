

class MyUser{
 final String username; 
 final String uid;
 final String image;
 

  MyUser({required this.username, required this.uid, required this.image,});


factory MyUser.fromMap(Map<String,dynamic>map){
  return MyUser(username:map['username']??'', uid: map['uid']??"", image: map["image"]??"",);
}
}