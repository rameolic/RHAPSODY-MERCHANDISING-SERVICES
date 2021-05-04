import 'package:flutter/material.dart';
import '../Merchandiser/merchandiserscreens/MenuContent.dart';
import '../Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/main.dart';


class chat{
  static String receiver;
}

//receiver sender
String receiver = currentuser.roleid ==  5 ? chat.receiver : "Emp5906";

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController typedmsg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Text(
              'HQ Communication',
              style: TextStyle(color: orange),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StreamBuilder<QuerySnapshot>(
                      stream:  FirebaseFirestore.instance.collection('${DBrequestdata.receivedempid}.${chat.receiver}').orderBy('time', descending: true).snapshots(),
                      builder: (context,snapshot){
                        if(!snapshot.hasData){
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          );
                        }
                        if(snapshot.hasData){
                          data.messages = [];
                          for(var message in snapshot.data.docs){
                            final messagetext = message.data()['text'];
                            final messagesender = message.data()['sender'];
                            final time = message.data()['time'];
                            final messageWidget =
                            messagesender == '${DBrequestdata.receivedempid}' ?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/1.5),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right:10.0,bottom: 10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Material(
                                          color: Color(0xffFEE8DA),
                                          borderRadius: BorderRadius.only(topLeft:Radius.circular(10.0),bottomLeft:Radius.circular(10.0),bottomRight:Radius.circular(10.0)),
                                          elevation: 5.0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text('$messagetext',softWrap: true,style: TextStyle(fontSize: 16),),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0),
                                          child: Text(DateFormat("h:mma").format(DateTime.parse(time)),softWrap: true,style: TextStyle(fontSize: 10,color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ):
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/1.5),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:10.0,bottom: 10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Material(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(topRight:Radius.circular(10.0),bottomLeft:Radius.circular(10.0),bottomRight:Radius.circular(10.0)),
                                          elevation: 5.0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text('$messagetext',softWrap: true,style: TextStyle(fontSize: 16),),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0),
                                          child: Text(DateFormat("h:mma").format(DateTime.parse(time)),softWrap: true,style: TextStyle(fontSize: 10,color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                            data.messages.add(messageWidget);
                          }
                        }
                        return Expanded(
                          child: ListView(
                            reverse: true,
                            children: data.messages,
                          ),
                        );}
                  ),
                  Container(
                    padding: EdgeInsets.only(right:10.0),
                    margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                    decoration: BoxDecoration(
                      color: pink,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: orange),
                            controller: typedmsg,
                            cursorColor:orange,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                              focusColor: orange,
                              hintText: 'Type your message here...',
                              hintStyle: TextStyle(color: orange),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async{
                            if(typedmsg.text.isNotEmpty){
                             await FirebaseFirestore.instance.collection('${chat.receiver}.${DBrequestdata.receivedempid}').add({'text': typedmsg.text, 'sender': '${DBrequestdata.receivedempid}','time': '${DateTime.now()}',});
                             await FirebaseFirestore.instance.collection('${DBrequestdata.receivedempid}.${chat.receiver}').add({'text': typedmsg.text, 'sender': '${DBrequestdata.receivedempid}','time': '${DateTime.now()}',});
                              typedmsg.clear();
                            }
                          },
                          child: Icon(Icons.send,color: orange,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.fromLTRB(10.0, 10, 10.0, 10.0),
                decoration: BoxDecoration(
                  color: pink,
                  borderRadius: BorderRadius.circular(100.0),),
                child: Text('TO : $fieldmanagernameofcurrentmerch',style: TextStyle(fontSize: 16,color: orange),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class data{
  static List<Row>  messages;
}
