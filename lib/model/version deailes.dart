
import 'package:flutter/material.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/merchandiserdashboard.dart';
import 'package:merchandising/Constants.dart';

class AppVersion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image(
        height: MediaQuery.of(context).size.height/6,
        image: AssetImage('images/rmsLogo.png'),
      ),
          SizedBox(
            height: 15,
          ),
          Text("Version : 3.3.0"),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => DashBoard()));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.fromLTRB(15,10,15,10),
              decoration: BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child:Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 15,),
                  SizedBox(width: 15,),
                  Text("DashBoard",style: TextStyle(color: pink,fontSize: 16),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

