import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_x/models/user_model.dart';
import 'package:insta_x/utils/mediaquery.dart';
import 'package:insta_x/widgets/profile_widet/name_text.dart';

class ProfileAndFollow extends StatelessWidget {
  const ProfileAndFollow({super.key, required this.user});
  final MyUser user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: mediaQueryWidth(.9, context),
        height: mediaQueryHeight(.13, context),
        child: Row(
          children: [
          user.image.isNotEmpty?  InkWell(
            child: CircleAvatar(
                backgroundImage: NetworkImage(user.image),
                radius: 38,
              ),
          ):CircleAvatar(child: Icon(Icons.person),radius: 38,),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    NameText(user: user),
                    // post/follow/following
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // posts
                          Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Container(
                              height: mediaQueryHeight(.07, context),
                              width: mediaQueryWidth(.16, context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "0",
                                    style: GoogleFonts.roboto(
                                      color: const Color.fromARGB(
                                        255,
                                        77,
                                        76,
                                        76,
                                      ),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "posts",
                                      style: GoogleFonts.roboto(
                                        color: const Color.fromARGB(
                                          255,
                                          77,
                                          76,
                                          76,
                                        ),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // folllowers
                          Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Container(
                              height: mediaQueryHeight(.07, context),
                              width: mediaQueryWidth(.19, context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "1580",
                                    style: GoogleFonts.roboto(
                                      color: const Color.fromARGB(
                                        255,
                                        77,
                                        76,
                                        76,
                                      ),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "followers",
                                      style: GoogleFonts.roboto(
                                        color: const Color.fromARGB(
                                          255,
                                          77,
                                          76,
                                          76,
                                        ),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //following
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: mediaQueryHeight(.07, context),
                              width: mediaQueryWidth(.19, context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "235",
                                    style: GoogleFonts.roboto(
                                      color: const Color.fromARGB(
                                        255,
                                        77,
                                        76,
                                        76,
                                      ),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "following",
                                      style: GoogleFonts.roboto(
                                        color: const Color.fromARGB(
                                          255,
                                          77,
                                          76,
                                          76,
                                        ),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
