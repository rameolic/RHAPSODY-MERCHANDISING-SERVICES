import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/Fieldmanager/Add Store.dart';

class StoreDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("Store Details",style: TextStyle(color: orange),),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          Column(
            children: <Widget>[
              StoresList(),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext
                          context) =>
                              AddStores()));
                },
                backgroundColor: pink,
                elevation: 8.0,
                child: Icon(Icons.add,color: orange,),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class StoresList extends StatefulWidget {
  @override
  _StoresListState createState() => _StoresListState();
}

class _StoresListState extends State<StoresList> {
  static final List<String> storecode = <String>["1","2",];
  static final List<String> storename = <String>["Storename1","Storename2",];
  static final List<String> contactumber = <String>["6498753","73903215",];
  static final List<String> address = <String>["Vellore","Chennai",];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: storename.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Store Code"),
                      Text('${storecode[index]}'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(children: [
                    Text('Store Name:',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                    SizedBox(width: 10),
                    Text('${storename[index]}'),
                  ]),
                  SizedBox(height: 10),
                  Row(children: [
                    Text('Contact Number:',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                    SizedBox(width: 10),
                    Text(
                      '${contactumber[index]}',
                    )
                  ]),
                  SizedBox(height: 10),
                  Row(children: [
                    Text('Addressr:',
                        style: TextStyle(
                          fontSize: 13.0,
                        )),
                    SizedBox(width: 10),
                    Text(
                      '${address[index]}',
                    )
                  ]),

                ],
              ));
        });
  }
}
