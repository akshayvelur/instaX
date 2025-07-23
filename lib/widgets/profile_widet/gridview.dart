
import 'package:flutter/material.dart';

class GridMenu extends StatelessWidget {
  const GridMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
          Image.asset("assets/profile.png", scale: 20)],
          ),
          Image.asset("assets/reel.png", scale: 16),
          Image.asset("assets/avatar.png", scale: 17),
        ],
      ),
    );
  }
}

class photoGridView extends StatelessWidget {
  const photoGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 80, width: 80, color: Colors.amber);
  }
}
