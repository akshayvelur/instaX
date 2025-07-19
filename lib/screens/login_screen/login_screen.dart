import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_x/utils/mediaquery.dart';
import 'package:insta_x/widgets/login/commonButton.dart';
import 'package:insta_x/widgets/login/common_text_form.dart';
import 'package:insta_x/widgets/login/forgotten_password.dart';
import 'package:insta_x/widgets/login/language.dart';
import 'package:insta_x/widgets/splash_widget/splash_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordControllr = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                CommonTextForm(hint: "Password", controllers: passwordControllr),
                CommonButton(title: "Log in",),
                Forgotten(),
                 CommonButton(title: "Create a new account",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
