import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insta_x/firebase_options.dart';
import 'package:insta_x/screens/splash_screen/bloc/splash_bloc.dart';
import 'package:insta_x/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [Provider(create: (context) => SplashBloc(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insta_x',
        theme: ThemeData(
         scaffoldBackgroundColor: Colors.white
        ),
        home: SplashScreen()
      ),
    );
  }
}
