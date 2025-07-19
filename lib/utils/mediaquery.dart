import 'package:flutter/material.dart';

mediaQueryHeight(double x,BuildContext context){
  return MediaQuery.of(context).size.height*x;
}

mediaQueryWidth(double x,BuildContext context){
  return MediaQuery.of(context).size.width*x;
}