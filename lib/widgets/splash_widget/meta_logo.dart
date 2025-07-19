
import 'package:flutter/material.dart';
import 'package:insta_x/utils/mediaquery.dart';

class MetaLogo extends StatelessWidget {
  const MetaLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200),
      child: Center(
        child: Image.asset("assets/metaicons.jpeg", width: mediaQueryWidth(.2, context),
          height: mediaQueryHeight(.2, context),),
      ),
    );
  }
}
