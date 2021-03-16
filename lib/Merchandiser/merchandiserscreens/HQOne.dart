import 'package:flutter/material.dart';
import 'MenuContent.dart';
import '../../Constants.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:merchandising/api/api_service.dart';
//receiver sender
final String receiver = "rameolic";
final String sender = DBrequestdata.receivedempid;

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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.fromLTRB(10.0, 10, 10.0, 10.0),
                decoration: BoxDecoration(
                  color: pink,
                  borderRadius: BorderRadius.circular(100.0),),
                child: Text('Feildmanager: $receiver',style: TextStyle(fontSize: 16),),
              ),
              StreamBuilder//<QuerySnapshot>
                (
                  //stream:  FirebaseFirestore.instance.collection('$sender.$receiver').orderBy('time', descending: true).snapshots(),
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
                        messagesender == '$sender' ?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/1.5),
                              child: Padding(
                                padding: const EdgeInsets.only(right:10.0,bottom: 10.0),
                                child: Material(
                                  color: Color(0xffFEE8DA),
                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(10.0),bottomLeft:Radius.circular(10.0),bottomRight:Radius.circular(10.0)),
                                  elevation: 5.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(time,softWrap: true,style: TextStyle(fontSize: 10,color: Colors.grey),),
                                        SizedBox(width: 5.0,),
                                        Text('$messagetext',softWrap: true,style: TextStyle(fontSize: 18),),
                                      ],
                                    ),
                                  ),
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
                                child: Material(
                                  color: Color(0xffFEE8DA),
                                  borderRadius: BorderRadius.only(topRight:Radius.circular(10.0),bottomLeft:Radius.circular(10.0),bottomRight:Radius.circular(10.0)),
                                  elevation: 5.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text('$messagetext',softWrap: true,style: TextStyle(fontSize: 18),),
                                        SizedBox(width: 5.0,),
                                        Text(time,softWrap: true,style: TextStyle(fontSize: 10,color: Colors.grey),),
                                      ],
                                    ),
                                  ),
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
                         // await FirebaseFirestore.instance.collection('$receiver.$sender').add({'text': typedmsg.text, 'sender': '$sender','time': '${DateFormat("h:mma").format(DateTime.now())}',});
                         // await FirebaseFirestore.instance.collection('$sender.$receiver').add({'text': typedmsg.text, 'sender': '$sender','time': '${DateFormat("h:mma").format(DateTime.now())}',});
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
        ],
      ),
    );
  }
}


class data{
  static List<Row>  messages;
}
