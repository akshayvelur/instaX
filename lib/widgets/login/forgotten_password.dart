
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgotten extends StatelessWidget {
  const Forgotten({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text("Forgotten password?",style: GoogleFonts.roboto(fontSize: 16),),
    );
  }
}
