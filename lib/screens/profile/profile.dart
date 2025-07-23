import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_x/models/post_model.dart';
import 'package:insta_x/models/user_model.dart';
import 'package:insta_x/utils/mediaquery.dart';
import 'package:insta_x/widgets/profile_widet/edit_profile.dart';
import 'package:insta_x/widgets/profile_widet/grid_stream.dart';
import 'package:insta_x/widgets/profile_widet/gridview.dart';
import 'package:insta_x/widgets/profile_widet/profile_and_follow.dart';
import 'package:insta_x/widgets/profile_widet/profile_widget.dart';
import 'package:insta_x/widgets/profile_widet/status_view.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> usertream =
      FirebaseFirestore.instance.collection("users").snapshots();
  FirebaseAuth auth = FirebaseAuth.instance;

  late final String uid;
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = auth.currentUser!.uid;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get postsStream {
    return FirebaseFirestore.instance
        .collection("posts")
        .doc("publicPost")
        .collection("userPost")
        .where('uid', isEqualTo: uid)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return   StreamBuilder(
      stream: usertream,
      builder: (
        context,
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      ) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        List<MyUser> data =
            snapshot.data!.docs.map((e) {
              final data = e.data() as Map<String, dynamic>;
              return MyUser.fromMap(data);
            }).toList();
        //log(data.toString());

        final user = data.firstWhere((element) => element.uid == uid);
        log(user.image);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(mediaQueryHeight(.07, context)),
            child: ProfileAppBar(user: user),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                ProfileAndFollow(user: user),
                EditProfileShareprofile(),
                StatusView(),
                GridMenu(),
              GridStream(uid: uid,)
              ],
            ),
          ),
        );
      },
    );
  }
}