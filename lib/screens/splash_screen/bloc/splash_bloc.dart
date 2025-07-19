import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()){
    on<LoadingEvent>(loadingEvent);
  }

  FutureOr<void> loadingEvent(LoadingEvent event, Emitter<SplashState> emit) async{
   await Future.delayed(Duration(seconds: 2));
    emit(LoadingState());
  }
}
