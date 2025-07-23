
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_x/utils/mediaquery.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.img,
  });

  final File? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQueryHeight(.5, context),
      width: mediaQueryWidth(.9, context),
      child: Image.file(img!, fit: BoxFit.contain),
    );
  }
}
