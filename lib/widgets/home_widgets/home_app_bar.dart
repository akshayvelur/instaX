
import 'package:flutter/material.dart';
import 'package:insta_x/utils/mediaquery.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 150,
      leading: Image.asset("assets/instagram2.png"),
      actions: [
        Image.asset("assets/heart.png", scale: 20),
        SizedBox(width: mediaQueryWidth(.07, context)),
        Image.asset("assets/send.png", scale: 20),
        SizedBox(width: mediaQueryWidth(.06, context)),
      ],
    );
  }
}
