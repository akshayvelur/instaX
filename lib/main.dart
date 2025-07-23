import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insta_x/firebase_options.dart';
import 'package:insta_x/screens/login_screen/bloc/login_bloc.dart';
import 'package:insta_x/screens/posts/bloc/post_bloc.dart';
import 'package:insta_x/screens/splash_screen/bloc/splash_bloc.dart';
import 'package:insta_x/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
await Supabase.initialize(url:"https://vcvknamxdiwfxulhmwch.supabase.co", anonKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZjdmtuYW14ZGl3Znh1bGhtd2NoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMwOTQxMDQsImV4cCI6MjA2ODY3MDEwNH0.FSJWfJQJFsoy6uRWc3vKAN4UW2xv1fG3GOla_XjYrHo");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [Provider(create: (context) => SplashBloc(),
    ),Provider(create: (context) => LoginBloc()),Provider(create: (context) => PostBloc(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insta_x',
        theme: ThemeData(
         scaffoldBackgroundColor: Colors.white,appBarTheme: AppBarTheme(color: Colors.white)
        ),
        home: SplashScreen()
      ),
    );
  }
}
