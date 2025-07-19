import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_x/screens/home_page/home_page.dart';
import 'package:insta_x/screens/login_screen/bloc/login_bloc.dart';
import 'package:insta_x/screens/login_screen/login_screen.dart';
import 'package:insta_x/services/authentication.dart';
import 'package:insta_x/utils/mediaquery.dart';
import 'package:insta_x/utils/page_transation.dart';
import 'package:insta_x/widgets/create_account_widget/create_button.dart';
import 'package:insta_x/widgets/login/black_and_white_meta.dart';
import 'package:insta_x/widgets/login/commonButton.dart';
import 'package:insta_x/widgets/login/common_text_form.dart';
import 'package:insta_x/widgets/login/forgotten_password.dart';
import 'package:insta_x/widgets/login/language.dart';
import 'package:insta_x/widgets/splash_widget/splash_widget.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});
  TextEditingController nameController = TextEditingController();
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
          if (state is AccountLoadingState) {
            Center(child: CircularProgressIndicator());
          }
          if (state is CreateAccountState) {
            Navigator.pushReplacement(
              context,
              FadeTransitionPageRoute(child: LoginScreen()),
            );
          }
          if (state is AccountCreatedAlertState) {
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
                    SizedBox(height: mediaQueryHeight(.15, context)),
                    Logo(),
                    CommonTextForm(
                      hint: "User name",
                      controllers: nameController,
                    ),
                    CommonTextForm(
                      hint: "Email address",
                      controllers: emailController,
                    ),
                    CommonTextForm(
                      hint: "Password",
                      controllers: passwordControllr,
                    ),

                    CreateButton(
                      title: "Create account",
                      backgroundClr: Colors.white,
                      textClr: Colors.blue,
                      onTap: () {
                        if(emailController.text.isNotEmpty&&passwordControllr.text.isNotEmpty&&nameController.text.isNotEmpty){
                        context.read<LoginBloc>().add(
                          CreateAccoutEvent(
                            userName: nameController.text,
                            email: emailController.text,
                            password: passwordControllr.text,
                          ),
                        );
                        }
                      },
                    ),
                    SizedBox(height: mediaQueryHeight(.13, context)),
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
