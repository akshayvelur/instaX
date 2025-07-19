import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_x/screens/login_screen/login_screen.dart';
import 'package:insta_x/screens/splash_screen/bloc/splash_bloc.dart';
import 'package:insta_x/utils/mediaquery.dart';
import 'package:insta_x/utils/page_transation.dart';
import 'package:insta_x/widgets/splash_widget/meta_logo.dart';
import 'package:insta_x/widgets/splash_widget/splash_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<SplashBloc>().add(LoadingEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if( state is SplashState){
          Navigator.push(context, FadeTransitionPageRoute(child:LoginScreen() ));
        }
        // TODO: implement listener
      },
      child: Scaffold(body: Column(children: [InstagramLogo(), MetaLogo()])),
    );
  }
}
