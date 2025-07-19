
import 'package:flutter/material.dart';

class CommonTextForm extends StatelessWidget {
  const CommonTextForm({
    super.key,required this.hint,required this.controllers
  });
 final String hint;
 final TextEditingController controllers;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,),
      child: TextFormField(
        controller:controllers ,
        decoration: InputDecoration(hintText: hint,labelText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
