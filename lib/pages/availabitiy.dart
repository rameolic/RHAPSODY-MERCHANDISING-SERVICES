import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Text(
            'Availability',
            style: TextStyle(color: orange),
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
                    margin: EdgeInsets.all(10.0),
                    height: 40,
                    padding: EdgeInsets.all(10.00),
                    decoration: BoxDecoration(
                        color: pink,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Expanded(
                      child: Theme(
                        data: ThemeData(primaryColor: orange),
                        child: TextField(
                          cursorColor: orange,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusColor: Colors.black,
                            hintText: 'Search by Customer Code/Name',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                            ),
                            suffixIcon: Icon(
                              CupertinoIcons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(

                    margin: EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: orange,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                    ),
                    height: 40.0,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "Item/Description",
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          " Avl",
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 35,
                      width: double.infinity,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      padding: EdgeInsets.all(10),
                      child: FittedBox(
                          fit: BoxFit.fitHeight, child: Text("Tang"))),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Table(
                      border: TableBorder.symmetric(
                        inside: BorderSide(color: Colors.grey),),
                      columnWidths: {
                        0: FractionColumnWidth(0.65),
                        1: FractionColumnWidth(0.35),
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF3E0),
                          ),
                          children: [
                            Productdetailes(
                              productid: "58745",
                              productsubname: "Tang Orange Instant Drink  Mix",
                              packweightingrams: "500 Gm Pack",
                            ),
                            SwitchOne(),
                          ],
                        ),
                        TableRow(
                          decoration:
                          BoxDecoration(color: Color(0xFFFFF3E0)),
                          children: [
                            Productdetailes(
                              productid: "58754",
                              productsubname: "Tang  Orange Instant Drink  Mix",
                              packweightingrams: "750 Gm Pack",
                            ),
                            SwitchOne(),
                          ],
                        ),
                        TableRow(
                          decoration:
                          BoxDecoration(color: Color(0xFFFFF3E0)),
                          children: [
                            Productdetailes(
                              productid: "58887",
                              productsubname: "Tang  Lemon Instant Drink  Mix",
                              packweightingrams: "500 Gm Pack",
                            ),
                            SwitchOne(),
                          ],
                        ),
                        TableRow(
                          decoration:
                          BoxDecoration(color: Color(0xFFFFF3E0)),
                          children: [
                            Productdetailes(
                              productid: "58745",
                              productsubname: "Tang  Mango Instant Drink  Mix",
                              packweightingrams: "750 Gm Pack",
                            ),
                            SwitchOne(),
                          ],
                        ),
                        TableRow(
                          decoration:
                          BoxDecoration(color: Color(0xFFFFF3E0)),
                          children: [
                            Productdetailes(
                              productid: "58897",
                              productsubname: "Tang Mosambi Instant Drink Mix",
                              packweightingrams: "500 Gm Pack",
                            ),
                            SwitchOne(),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF3E0),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0)),
                          ),
                          children: [
                            Productdetailes(
                              productid: "58664",
                              productsubname: "Tang Lemon and Mint Drink Mix",
                              packweightingrams: "750 Gm Pack",
                            ),
                            SwitchOne(),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height:30),
                ],
              ),
            ),
          ],
        ));
  }
}

class SwitchOne extends StatefulWidget {
  @override
  _SwitchOneState createState() => _SwitchOneState();
}

class _SwitchOneState extends State<SwitchOne> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.transparent,
      child: Column(
        children: [
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },
            inactiveTrackColor: orange,
            activeColor: Colors.red,
          ),
          isSwitched == true ? DropDown() : SizedBox(width: 5,)
        ],
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  int dropDownValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        elevation: 0,
        dropdownColor: Colors.white,
        value: dropDownValue,
        onChanged: (int newVal) {
          setState(() {
            dropDownValue = newVal;
          });
        },
        items: [
          DropdownMenuItem(
            value: 0,
            child: Text(
              'Reason',
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
          DropdownMenuItem(
            value: 1,
            child: Text(
              'Reason1',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          DropdownMenuItem(
            value: 2,
            child: Text(
              'Reason2',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          DropdownMenuItem(
            value: 3,
            child: Text(
              'Reason3',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}

class Productdetailes extends StatelessWidget {
  Productdetailes({this.productid, this.productsubname, this.packweightingrams});
  final productid;
  final productsubname;
  final packweightingrams;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Color(0xFFFFF3E0)),
      width: 370,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                productid,
              ),
              SizedBox(width: 10,),
              Text(
                packweightingrams,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text(
            productsubname,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
