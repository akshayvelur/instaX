import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta_x/models/post_model.dart';
import 'package:insta_x/utils/mediaquery.dart';
import 'package:intl/intl.dart';

class StreamersWidget extends StatefulWidget {
  StreamersWidget({super.key});
  Stream<QuerySnapshot<Map<String, dynamic>>> posts =
      FirebaseFirestore.instance
          .collection("posts")
          .doc("publicPost")
          .collection("userPost").orderBy('createdAt', descending: true) // latest post first
    .snapshots();
         
  @override
  State<StreamersWidget> createState() => _StreamersWidgetState();
}

class _StreamersWidgetState extends State<StreamersWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.posts,
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
        List<PublicPost> allposts =
            snapshot.data!.docs.map((e) {
              final data = e.data() as Map<String, dynamic>;
              return PublicPost.fromMap(data);
            }).toList();
        return allposts.isNotEmpty
            ? Container(
              height: mediaQueryHeight(.69, context),
              width: mediaQueryWidth(9, context),
              child: ListView.builder(
                itemCount: allposts.length,
                itemBuilder: (context, index) {
                  final selected = allposts[index];
                  Timestamp timestamp=selected.createdAt;
                  
                  DateTime dateTime = timestamp.toDate();
                  String formattedDate = DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: mediaQueryWidth(.9, context),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  selected.ProfilePic,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(selected.username),
                              ),
                              SizedBox(width: mediaQueryWidth(.62, context)),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.more_vert_outlined),
                              ),
                            ],
                          ),
                          Container(
                            height: mediaQueryHeight(.33, context),
                            child: CachedNetworkImage(
                              imageUrl: selected.img,
                              scale: 10,
                              fit: BoxFit.contain,
                              placeholder: (context, url) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              errorListener:
                                  (value) => Center(child: Icon(Icons.error)),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.asset(
                                  "assets/heart.png",
                                  scale: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Image.asset(
                                  "assets/chat.png",
                                  scale: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Image.asset(
                                  "assets/send.png",
                                  scale: 20,
                                ),
                              ),
                              SizedBox(width: mediaQueryWidth(.55, context)),
                              Image.asset("assets/bookmark.png", scale: 20),
                            ],
                          ),
                          selected.caption.isNotEmpty
                              ? Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: mediaQueryWidth(.8, context),
                                    height: mediaQueryHeight(.04, context),
                                    child: Text(
                                      selected.caption,
                                      overflow: TextOverflow.clip,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              )
                              : Text(""),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Align(alignment: Alignment.centerLeft,child: Text(formattedDate.toString())),
                        )],
                      ),
                    ),
                  );
                },
              ),
            )
            : Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(child: Text("No Post")),
            );
      },
    );
  }
}
