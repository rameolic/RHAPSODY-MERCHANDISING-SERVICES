import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'addoutlets.dart';

class Oulets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("Outlets",style: TextStyle(color: orange),),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          OutletList(),
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
                              AddOutlets()));
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

class OutletList extends StatefulWidget {
  @override
  _OutletListState createState() => _OutletListState();
}

class _OutletListState extends State<OutletList> {
  static final List<String> outletname = <String>["Outletname1","Outletname2",];
  static final List<String> outletarea = <String>["PVR","ABC Mall",];
  static final List<String> outletcity = <String>["Vellore","Vellore",];
  static final List<String> outletstate = <String>["TamilNadu","TamilNadu",];
  static final List<String> outletcountry = <String>["India","india"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: outletname.length,
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
                  Row(children: [
                    Text('OutletName :',
                        style: TextStyle(
                          fontSize: 14.0,fontWeight: FontWeight.bold,
                        )),
                    SizedBox(width: 10),
                    Text('${outletname[index]}',style:TextStyle(
                      fontSize: 14.0,fontWeight: FontWeight.bold,
                    ) ,),
                  ]),
                  SizedBox(height: 10),
                  Row(children: [
                    Text('Outlet Area :',
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                    SizedBox(width: 10),
                    Text(
                      '${outletarea[index]}',
                    )
                  ]),
                  SizedBox(height: 10),
                  Row(children: [
                    Text('Outlet City :',
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                    SizedBox(width: 10),
                    Text('${outletcity[index]}',
                    ),
                  ]),
                  SizedBox(height: 10),

                  Row(children: [
                    Text('outlet State :',
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                    SizedBox(width: 10),
                    Text('${outletstate[index]}',
                    ),
                  ]),
                  SizedBox(height: 10),
                  Row(children: [
                    Text('Outlet Country :',
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                    SizedBox(width: 10),
                    Text('${outletcountry[index]}',
                    ),
                  ]),
                ],
              ));
        });
  }
}
