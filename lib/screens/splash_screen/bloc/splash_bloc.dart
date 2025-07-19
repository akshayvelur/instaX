import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()){
    on<LoadingEvent>(loadingEvent);
  }

  FutureOr<void> loadingEvent(LoadingEvent event, Emitter<SplashState> emit) async{
    FirebaseAuth auth=FirebaseAuth.instance;
   await Future.delayed(Duration(seconds: 2));
      if(auth.currentUser!=null){
 emit(AlreadyloggedState());
    }else{
   emit(LoadingState());
   }
   
  }
}
