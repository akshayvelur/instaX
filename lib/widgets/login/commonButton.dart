
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_x/utils/mediaquery.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,required this.title
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: mediaQueryWidth(.9, context),
        height: mediaQueryHeight(.05, context),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(title,style: GoogleFonts.roboto(fontSize: 16,color: Colors.white),),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.blue),
          ),
        ),
      ),
    );
  }
}
