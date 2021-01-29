import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:merchandising/pages/CompetitionCheckOne.dart';
import 'MenuContent.dart';
import '../Constants.dart';


class FocusNPDCheck extends StatefulWidget {
  @override
  _FocusNPDCheckState createState() => _FocusNPDCheckState();
}

class _FocusNPDCheckState extends State<FocusNPDCheck> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGround(),
        Scaffold(

          appBar: AppBar(
            backgroundColor: containerscolor,
            iconTheme: IconThemeData(color: orange),
            title: Row(
              children: [
                Text(
                  'Focus/NPD Check',
                  style: TextStyle(color: orange),
                ),
                Spacer(),
                SubmitButton(
                  onpress: (){
                    {Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CompetitionCheckOne()));}
                  },
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    OutletDetails(),
                    Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xFFFFF3E0),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(left: 10,right: 10,top: 10),

                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 30,
                              width: 250,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Search by Item Name/Code'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60, 8, 8, 8),
                            child: IconButton(
                              icon: Icon(CupertinoIcons.search,
                                  size: 25, color: Colors.grey[700]),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(

                      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height/3,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xFFFFF3E0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("554574"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Tang Orange Instant Drink Mix",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(flex: 1),
                              FocusNPDSwitch(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tgt Qty",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                  ),
                                  Text(
                                    "\n 12",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: Colors.green[800]),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Actual Qty",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0)),
                                  Text("\n8",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Colors.green[800])),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("\nReason for Deviation",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0)),
                                  FocusNPDDropdown(),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Selling Price",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0)),
                                  Text("\n48",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Colors.green[800])),
                                ],
                              ),
                            ],
                          ),
                          Row(

                            children: [

                              Spacer(flex: 1),
                              Text(
                                "Photograph",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14.0),
                              ),
                              Spacer(flex: 15),
                              Icon(
                                CupertinoIcons.camera,
                                color: Colors.green[800],
                              ),
                              Spacer(flex: 1),
                            ],
                          ),
                        ],
                      ),
                    ),
                    FocusNPDCustom(
                      prodtext: "Tang Mango Instant Drink Mix",
                    ),
                    FocusNPDCustom(
                      prodtext: "Tang Lemon Instant Drink Mix",
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class FocusNPDSwitch extends StatefulWidget {
  @override
  _FocusNPDSwitchState createState() => _FocusNPDSwitchState();
}

class _FocusNPDSwitchState extends State<FocusNPDSwitch> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(

      child:
      Switch(value: isSwitched, onChanged:(value){
        setState((){
          isSwitched = value;
          print(isSwitched);

        });
      },

        inactiveTrackColor: Colors.green,
        activeColor:Colors.red,
      ),);
  }
}
class FocusNPDDropdown extends StatefulWidget {
  @override
  _FocusNPDDropdownState createState() => _FocusNPDDropdownState();
}

class _FocusNPDDropdownState extends State<FocusNPDDropdown> {
  @override
  int dropDownValue = 0;
  Widget build(BuildContext context) {
    return  Container(
      child: DropdownButton(
        dropdownColor: Colors.white,
        value: dropDownValue,
        onChanged: (int newVal){
          setState(() {
            dropDownValue = newVal;
          });
        },
        items: [
          DropdownMenuItem(
            value: 1,
            child: Text('All Categories'),
          ),
          DropdownMenuItem(
            value: 0,
            child: Text('Item Mismatch'),
          ),
        ],
      ),
    );
  }
}
class FocusNPDCustom extends StatelessWidget {
  FocusNPDCustom({this.prodtext});
  final prodtext;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: 70,
        width: 410,
        decoration: BoxDecoration(color: Color(0xFFFFF3E0),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Text(
              prodtext,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.green[800]),
            ),
            Spacer(),
            FocusNPDSwitch(),

          ],
        ));

  }
}

class SubmitButton extends StatelessWidget {
  SubmitButton({@required this.onpress});
  final onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin:EdgeInsets.only(right:10.00),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xffFFDBC1),
          borderRadius: BorderRadius.circular(10.00),
        ),
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}

