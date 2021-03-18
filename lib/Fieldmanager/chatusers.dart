import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/api/timesheetapi.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Time Sheet.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/api/timesheetmonthly.dart';
import 'package:merchandising/api/FMapi/merchnamelistapi.dart';
import 'package:merchandising/chatscreen.dart';



class chatusers extends StatefulWidget {
  @override
  _chatusersState createState() => _chatusersState();
}

class _chatusersState extends State<chatusers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("HQ Communication",style: TextStyle(color: orange),),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: merchnamelist.firstname.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap:()async{
                    setState(() {
                      chat.receiver = merchnamelist.employeeid[index];
                    });
                    print(merchnamelist.employeeid[index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContextcontext) => ChatScreen()));
                  },
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.fromLTRB(10.0,5,10,5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Merchandiser : ${merchnamelist.name[index]}',
                              style: TextStyle(
                                  fontSize: 16.0,color: orange
                              )),
                          SizedBox(height: 5),
                          Text('Emp ID : ${merchnamelist.employeeid[index]}',
                              style: TextStyle(
                                fontSize: 14.0,
                              )),
                        ],
                      )),
                );
              }),
        ],
      ),
    );
  }
}


