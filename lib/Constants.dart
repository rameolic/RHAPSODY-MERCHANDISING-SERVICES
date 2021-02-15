import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/api/api_service.dart';

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

//ignore: must_be_immutable
class OutletDetails extends StatelessWidget {
  int outletid = chekinoutlet.checkinoutletid;
  String outletname = chekinoutlet.checkinoutletname;
  String outletarea = chekinoutlet.checkinarea;
  String outletcity = chekinoutlet.checkincity;
  String outletstate = chekinoutlet.checkinstate;
  String outletcountry = chekinoutlet.checkincountry;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(5.00),
      decoration: BoxDecoration(
          color: pink,
          borderRadius: BorderRadiusDirectional.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10.0),
          Icon(
            Icons.house_sharp,
            color: iconscolor,size: 40,
          ),
          SizedBox(width: 5.0),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "[$outletid]",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize:16 ),
                  ),
                  Text(
                    outletname,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize:16),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('$outletarea,', style: TextStyle(fontSize:15),),
                  Text('$outletcity,', style: TextStyle(fontSize:15)),
                  Text('$outletstate,', style: TextStyle(fontSize:15)),
                  Text('$outletcountry', style: TextStyle(fontSize:15)),
                ],
              ),
            ],
          ),
          SizedBox(width: 20.0),
        ],
      ),
    );
  }
}

