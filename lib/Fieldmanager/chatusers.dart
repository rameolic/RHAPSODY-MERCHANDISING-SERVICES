import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/api/FMapi/merchnamelistapi.dart';
//import 'file:///C:/Users/ramkumar/StudioProjects/RHAPSODY-MERCHANDISING-SERVICES/lib/model/chatscreen.dart';
import'package:merchandising/model/chatscreen.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/model/goupchatscreen.dart';
import 'package:merchandising/model/allEmployeechatscreen.dart';
class ChatUsers extends StatefulWidget {
  @override
  _ChatUsersState createState() => _ChatUsersState();
}

class _ChatUsersState extends State<ChatUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Column(
          children: [
            Text("HQ Communication",style: TextStyle(color: orange),),
            EmpInfo()
          ],
        ),
      ),
      // drawer: Drawer(
      //   child: Menu(),
      // ),
      body: Stack(
        children: [
          BackGround(),
          Column(
            children: [
              SizedBox(height: 10.0,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: non_constant_identifier_names
                          builder: (BuildContextcontext) => AllChatScreen()));
                },
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.fromLTRB(10.0,0,10,10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rhapsody Merchandising Services',
                            style: TextStyle(
                                fontSize: 16.0,color: orange
                            )),
                        SizedBox(height: 5 ,),
                        Text('participants : All',
                            style: TextStyle(
                                fontSize: 14.0,color: grey
                            )),
                      ],
                    )),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: non_constant_identifier_names
                          builder: (BuildContextcontext) => FmGroupChatScreen()));
                },
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.fromLTRB(10.0,0,10,10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Field managers Group Chat',
                            style: TextStyle(
                                fontSize: 16.0,color: orange
                            )),
                        SizedBox(height: 5 ,),
                        Text('participants : All Field manager\'s',
                            style: TextStyle(
                                fontSize: 14.0,color: grey
                            )),
                      ],
                    )),
              ),
              Expanded(
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: merchnamelist.firstname.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap:()async{
                          setState(() {
                            chat.receiver = merchnamelist.employeeid[index];
                          });
                          fieldmanagernameofcurrentmerch = merchnamelist.name[index];
                          print(merchnamelist.employeeid[index]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // ignore: non_constant_identifier_names
                                  builder: (BuildContextcontext) => ChatScreen()));
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.fromLTRB(10.0,0,10,10),
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
                                        fontSize: 14.0,color: grey
                                    )),
                              ],
                            )),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


