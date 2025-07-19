
import 'package:flutter/material.dart';

class LanguageText extends StatelessWidget {
  const LanguageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 90),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("English (India) "),Icon(Icons.keyboard_arrow_down_sharp)
        ],
      ),
    );
  }
}