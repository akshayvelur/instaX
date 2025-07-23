
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_x/models/user_model.dart';
import 'package:insta_x/utils/mediaquery.dart';

class NameText extends StatelessWidget {
  const NameText({
    super.key,required this.user
  });
final MyUser user;
  @override
  Widget build(BuildContext context) {
    return Container(width: mediaQueryWidth(.5, context) ,height: mediaQueryHeight(.035, context),child: Text(user.username,style: GoogleFonts.aBeeZee(fontSize: 18),maxLines: 1,overflow: TextOverflow.ellipsis,));
  }
}
