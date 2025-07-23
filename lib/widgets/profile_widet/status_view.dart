
import 'package:flutter/material.dart';
import 'package:insta_x/utils/mediaquery.dart';

class StatusView extends StatelessWidget {
  const StatusView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(height:mediaQueryHeight(0.15, context),width: mediaQueryWidth(1, context),
        child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 1,itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(blurRadius: .5,color: const Color.fromARGB(255, 228, 227, 227))]
                  ),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                    radius: 40,
                    child:CircleAvatar(radius: 37,backgroundColor: Colors.white,child: Center(child: Icon(Icons.add),),), // or image
                  ),
                ),
              ),
           Text("New") ],
          );
        }
        ,),
      ),
    );
  }
}
