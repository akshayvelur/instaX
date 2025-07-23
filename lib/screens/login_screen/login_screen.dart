import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_x/screens/bottom_navigator/bottom_navigator.dart';
import 'package:insta_x/screens/create_account/create_account.dart';

import 'package:insta_x/screens/home_page/home_page.dart';
import 'package:insta_x/screens/login_screen/bloc/login_bloc.dart';
import 'package:insta_x/services/authentication.dart';
import 'package:insta_x/utils/page_transation.dart';
import 'package:insta_x/widgets/login/black_and_white_meta.dart';
import 'package:insta_x/widgets/login/commonButton.dart';
import 'package:insta_x/widgets/login/common_text_form.dart';
import 'package:insta_x/widgets/login/forgotten_password.dart';
import 'package:insta_x/widgets/login/language.dart';
import 'package:insta_x/widgets/splash_widget/splash_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControllr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginState) {
            CircularProgressIndicator();
          }
         
          if (state is EmailOrPasswordErrorState) {
            showDialog(
              context: context,
              builder:
                  (_) => AlertDialog(
                   backgroundColor: const Color.fromARGB(226, 180, 173, 173),
                     
                    content: Padding(
                      padding: const EdgeInsets.only(left: 35,top: 35),
                      child: Text(
                        state.erroring,
                        style: GoogleFonts.roboto(color: Colors.red),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"),
                      ),
                    ],
                  ),
            );
          }
          if (state is LoginAccountState) {
            Navigator.pushReplacement(
              context,
              FadeTransitionPageRoute(child:BottomNavigate()),
            );
          }
          if(state is NavigateTocreateState){
             Navigator.pushReplacement(
              context,
              FadeTransitionPageRoute(child: CreateAccountScreen()),
            );
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LanguageText(),
                    Logo(),
                    CommonTextForm(
                      hint: "Email address",
                      controllers: emailController,
                    ),
                    CommonTextForm(
                      hint: "Password",
                      controllers: passwordControllr,
                    ),
                   
                    CommonButton(
                      title: "Log in",
                      textClr: Colors.white,
                      backgroundClr: Colors.blue,
                      onTap: () {
                        if (emailController.text.isNotEmpty &&
                            passwordControllr.text.isNotEmpty) {
                          context.read<LoginBloc>().add(
                            SignInAccountEvent(
                              email: emailController.text,
                              password: passwordControllr.text,
                            ),
                          );
                        }
                      },
                    ),
                    Forgotten(),
                    CommonButton(
                      title: "Creat a new account",
                      textClr: Colors.blue,
                      backgroundClr: Colors.white,
                      onTap: () {
                        
                        context.read<LoginBloc>().add(NavigateToCreateEvent());
                       //signOutUser();
                      },
                    ),
                    BlackAndwhiteMeta(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
