import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';

final containerscolor = Color(0xffFAECE3);
final alertboxcolor = Colors.white;
final transparentwhite = Colors.white.withOpacity(0.18);
final iconscolor = Color(0xff424B4D);
const grey = Color(0xFFB4B5B9);
const orange = Color(0xFFF58426);
const pink = Color(0xffFEE8DA);
class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFB4B5B9), Color(0xFFF58426)])),
    );
  }
}

