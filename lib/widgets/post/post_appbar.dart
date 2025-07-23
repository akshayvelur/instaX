
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_x/screens/posts/bloc/post_bloc.dart';
import 'package:insta_x/utils/mediaquery.dart';

class PostAppBar extends StatelessWidget {
  const PostAppBar({
    super.key,
    required this.img,
    required this.caption,
  });

  final File? img;
  final TextEditingController caption;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("create Post", style: GoogleFonts.aBeeZee()),
      actions: [
        InkWell(
          onTap: () {
            context.read<PostBloc>().add(
              PostingEvent(img: img!, caption: caption.text),
            );
          },
          child: Text(
            "Post",
            style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: mediaQueryWidth(.04, context)),
      ],
    );
  }
}
