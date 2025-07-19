import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

SignUp( String email,String password)async{
final FirebaseAuth auth= await FirebaseAuth.instance;

if(email.isNotEmpty&&password.isNotEmpty){
try{
await auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
log("authentic success");
return true;
}catch(e){
  log(e.toString());
}
}
return false;
}



SignIn( String email,String password)async{


final FirebaseAuth auth= FirebaseAuth.instance;
  if(email.isNotEmpty&&password.isNotEmpty){
   
 await auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
   
log("authentic success");
return true;
}
return false;


}


Future<void> signOutUser() async {
  await FirebaseAuth.instance.signOut();
}
