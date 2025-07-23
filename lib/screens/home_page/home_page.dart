import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:insta_x/models/post_model.dart';
import 'package:insta_x/utils/mediaquery.dart';
import 'package:insta_x/widgets/home_widgets/home_app_bar.dart';
import 'package:insta_x/widgets/home_widgets/status_view.dart';
import 'package:insta_x/widgets/home_widgets/stream_widgets.dart';
import 'package:insta_x/widgets/profile_widet/status_view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mediaQueryHeight(.065, context)),
        child: HomeAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                HomeStatus(),
               StreamersWidget()
              ],
            ),
          
          ],
        ),
      ),
    );
  }
}