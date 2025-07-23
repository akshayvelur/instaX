
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta_x/models/post_model.dart';
import 'package:insta_x/utils/mediaquery.dart';

class GridStream extends StatefulWidget {
  const GridStream({super.key, required this.uid});
  final String uid;

  @override
  State<GridStream> createState() => _GridStreamState();
}

class _GridStreamState extends State<GridStream> {
  Stream<QuerySnapshot<Map<String, dynamic>>> get postsStream {
    return FirebaseFirestore.instance
        .collection("posts")
        .doc("publicPost")
        .collection("userPost")
        .where('uid', isEqualTo: widget.uid)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: postsStream,
      builder: (
        context,
        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      ) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        List<PublicPost> allposts = snapshot.data!.docs.map((e) {
          final data = e.data() as Map<String, dynamic>;
          return PublicPost.fromMap(data);
        }).toList();

        return Container(
          height: mediaQueryHeight(.38, context),
          width: mediaQueryWidth(.9, context),
          child: GridView.builder(
            itemCount: allposts.length > 4 ? 4 : allposts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final mypost = allposts[index];
              return CachedNetworkImage(
                imageUrl: mypost.img,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
                fit: BoxFit.cover,
              );
            },
          ),
        );
      },
    );
  }
}
