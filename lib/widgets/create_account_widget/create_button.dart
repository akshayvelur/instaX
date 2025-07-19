
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_x/screens/home_page/home_page.dart';
import 'package:insta_x/utils/mediaquery.dart';
import 'package:insta_x/utils/page_transation.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({
    super.key,required this.title,required this.textClr,required this.backgroundClr,required this.onTap,
  });
  final Color backgroundClr;
final String title;
final Color textClr;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: mediaQueryWidth(.9, context),
        height: mediaQueryHeight(.055, context),decoration: BoxDecoration(border: Border.all(color: Colors.blue),borderRadius: BorderRadius.circular(25)),
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(title,style: GoogleFonts.roboto(fontSize: 16,color: textClr),),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(backgroundClr),
          ),
        ),
      ),
    );
  }
}
