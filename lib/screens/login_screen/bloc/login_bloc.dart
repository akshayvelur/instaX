import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_x/services/authentication.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()){
    on<SignInAccountEvent>(signInAccountEvent);
    on<NavigateToCreateEvent>(navigateToCreateEvent);
    on<CreateAccoutEvent>(createAccoutEvent);
  }



  FutureOr<void> navigateToCreateEvent(NavigateToCreateEvent event, Emitter<LoginState> emit) {
    
    emit(NavigateTocreateState());
  }

  FutureOr<void> signInAccountEvent(SignInAccountEvent event, Emitter<LoginState> emit) async{
   
  // emit(Loadingstate());
  // bool authcheck;
  
  //  authcheck= await SignIn(event.email, event.password);
  //   log(authcheck.toString());
  // if(authcheck){

  //   emit(CreateAccountState());
  // }
  // else{
  //  emit(EmailOrPasswordErrorState());
  // }
  
  // }
   final FirebaseAuth auth = FirebaseAuth.instance;
  try {
     emit(Loadingstate());
      await auth.signInWithEmailAndPassword(
        email: event.email.trim(),
        password:event. password.trim(),
      );
      if(auth.currentUser!.uid.isNotEmpty){
     emit(LoginAccountState());
      }
      
    } on FirebaseAuthException catch (e) {
     emit(EmailOrPasswordErrorState(erroring: e.message.toString()));
    //  return AuthResult(success: false, message: e.message);
    } 

  }

  FutureOr<void> createAccoutEvent(CreateAccoutEvent event, Emitter<LoginState> emit) async{
 //SignUp(event.email, event.password);
 final FirebaseAuth auth = FirebaseAuth.instance;
  try {
       emit(AccountLoadingState());
      await auth.createUserWithEmailAndPassword(
        email: event.email.trim(),
        password:event. password.trim(),
      );
      if(auth.currentUser!.uid.isNotEmpty){
        createUser(event.userName);
     emit(CreateAccountState());
      }
      
    } on FirebaseAuthException catch (e) {
     emit(AccountCreatedAlertState(erroring: e.message.toString()));
    //  return AuthResult(success: false, message: e.message);
    } 

  }
}
