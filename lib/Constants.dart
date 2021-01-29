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
  BackGround({this.child});
  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFB4B5B9), Color(0xFFF58426)])),
      child: child,
    );
  }
}


class OutletDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/15,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 5),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: pink,
          borderRadius: BorderRadiusDirectional.circular(10)),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Icon(
                Icons.house_sharp,
                color: iconscolor,
              ),
            ),
            SizedBox(width: 20.0),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "[5478] CARREFOUR MOE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  Text("Ground Floor,MOE,E11 Sheikh Zayed Dubai"),
                ],
              ),
            ),
            SizedBox(width: 20.0),
          ],
        ),
      ),
    );
  }
}

