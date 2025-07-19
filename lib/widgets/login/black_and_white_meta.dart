
import 'package:flutter/material.dart';
import 'package:insta_x/utils/mediaquery.dart';

class BlackAndwhiteMeta extends StatelessWidget {
  const BlackAndwhiteMeta({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/metaxs.jpeg",width: mediaQueryWidth(.19, context),height: mediaQueryHeight(.07, context),);
  }
}
