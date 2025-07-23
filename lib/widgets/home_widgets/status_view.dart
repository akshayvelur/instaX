
import 'package:flutter/material.dart';
import 'package:insta_x/utils/mediaquery.dart';

class HomeStatus extends StatelessWidget {
  const HomeStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height:mediaQueryHeight(0.15, context),width: mediaQueryWidth(1, context),
      child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 5,itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [     Color.fromARGB(255, 183, 183, 78),
                      Color.fromARGB(255, 219, 10, 177),
                 
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 40,
                  child:CircleAvatar(radius: 37,), // or image
                ),
              ),
            ),
         Text("Profile") ],
        );
      }
      ,),
    );
  }
}
