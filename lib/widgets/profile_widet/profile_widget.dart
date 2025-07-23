

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_x/models/user_model.dart';
import 'package:insta_x/utils/mediaquery.dart';

class ProfileAppBar extends StatelessWidget {
 ProfileAppBar({
    super.key,required this.user
  
  });
 final MyUser user;
  @override
  Widget build(BuildContext context) {
    return AppBar(titleSpacing: 20,
      automaticallyImplyLeading: false,
      title: Text(user.username, style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w700)),
        actions: [Image.asset("assets/threads.png",scale:20),
         SizedBox(width: mediaQueryWidth(.05, context),),
        Image.asset("assets/add.png",scale: 20,),
        SizedBox(width: mediaQueryWidth(.05, context),),
        Image.asset("assets/menu.png",scale: 18),
         SizedBox(width: mediaQueryWidth(.05, context),),],);
  }
}
