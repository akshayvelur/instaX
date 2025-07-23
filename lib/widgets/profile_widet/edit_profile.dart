
import 'package:flutter/material.dart';
import 'package:insta_x/utils/mediaquery.dart';

class EditProfileShareprofile extends StatelessWidget {
  const EditProfileShareprofile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: mediaQueryHeight(.04, context),
            width: mediaQueryWidth(0.35, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 239, 237, 237),
              boxShadow: [
                BoxShadow(color: Colors.black, blurRadius: .2),
              ],
            ),
            child: Center(child: Text("Edit profile")),
          ),
          Container(
            height: mediaQueryHeight(.04, context),
            width: mediaQueryWidth(0.39, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 239, 237, 237),
            boxShadow: [
                BoxShadow(color: Colors.black, blurRadius: .2),
              ], ), child: Center(child: Text("Share profile")),
          ),
          Container(
            height: mediaQueryHeight(.04, context),
            width: mediaQueryWidth(0.1, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
             color: const Color.fromARGB(255, 239, 237, 237),
            boxShadow: [
                BoxShadow(color: Colors.black, blurRadius: .2),
              ], ),child: Image.asset("assets/bookmark.png",scale: 40,),
          ),
        ],
      ),
    );
  }
}
