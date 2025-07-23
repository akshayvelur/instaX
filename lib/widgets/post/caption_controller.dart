
import 'package:flutter/material.dart';

class CaptionController extends StatelessWidget {
  const CaptionController({
    super.key,
    required this.caption,
  });

  final TextEditingController caption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: caption,
        decoration: InputDecoration(
          hintText: "Caption",
        ),
      ),
    );
  }
}
