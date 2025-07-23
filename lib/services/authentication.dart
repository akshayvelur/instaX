import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
createUser(String userName)async{
FirebaseAuth auth=FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  await _firestore.collection("users").doc(auth.currentUser!.uid).set({
"username":userName
,"uid":auth.currentUser!.uid ,"image":"","posts":[]});
}
Future<void> signOutUser() async {
  await FirebaseAuth.instance.signOut();
}
createPost(String img,String caption)async{

 FirebaseAuth auth=FirebaseAuth.instance;
 FirebaseFirestore _firestore=await FirebaseFirestore.instance;
 DocumentSnapshot userDoc=await _firestore.collection("users").doc(auth.currentUser!.uid).get();
 String username = userDoc['username'];
String url=userDoc['image'];

 
 await _firestore.collection("posts").doc("publicPost").collection("userPost").add({
  "uid":auth.currentUser!.uid,"username":username,"img":img,"caption":caption,"createdAt": FieldValue.serverTimestamp(),"profilePic":url
 });
 
//await _firestore.collection(auth.currentUser!.uid).doc("posts").update({caption:img});
}