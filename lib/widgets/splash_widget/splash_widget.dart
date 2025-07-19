
import 'package:flutter/material.dart';
import 'package:insta_x/utils/mediaquery.dart';

class InstagramLogo extends StatelessWidget {
  const InstagramLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Image.asset(
          "assets/instagram.png",
          width: mediaQueryWidth(.2, context),
          height: mediaQueryHeight(.2, context),
        ),
      ),
    );
  }
}



class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 60,bottom: 30),
        child: Image.asset(
          "assets/instagram.png",
          width: mediaQueryWidth(.15, context),
          height: mediaQueryHeight(.15, context),
        ),
      ),
    );
  }
}
