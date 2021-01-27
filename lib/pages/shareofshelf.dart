import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';

class ShareShelf extends StatefulWidget {
  @override
  _ShareShelfState createState() => _ShareShelfState();
}

class _ShareShelfState extends State<ShareShelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Text(
            'Share of Shelf',
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

                Container(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10.00),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: pink,
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Icon(
                            Icons.house_sharp,
                            color: iconscolor,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "[5478] CARREFOUR MOE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "Ground Floor,MOE,E11 Sheikh Zayed Dubai"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Table(
                    border: TableBorder.symmetric(
                      inside: BorderSide(color: Colors.grey),),

                    columnWidths: {
                      0: FractionColumnWidth(0.7),
                      1: FractionColumnWidth(0.3),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: orange,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),
                              topRight:Radius.circular(10.0) ),),
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.00),
                            child: Text(
                              "Colgate",
                              style: TextStyle(color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.00),
                            child: Text(
                              "15 Inches",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Custom(
                            text: "Pepsodent",
                          ),
                          CustomTwo(
                            text: "15 Inches",
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Custom(
                            text: "Oral -B",
                          ),
                          CustomTwo(
                            text: "11 Inches",
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Custom(
                            text: "Others",
                          ),
                          CustomTwo(
                            text: "9  Inches",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 4, 8, 0),
                  child: Table(
                    border: TableBorder.all(color: Color(0xFFBDBDBD)),
                    columnWidths: {
                      0: FractionColumnWidth(0.7),
                      1: FractionColumnWidth(0.3),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Color(0XFFF57C00)),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Tang",
                              style: TextStyle(color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "20 Inches",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                 ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Custom(
                            text: "Rasna",
                          ),
                          CustomTwo(
                            text: "9 Inches",
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Custom(
                            text: "Energile",
                          ),
                          CustomTwo(
                            text: "12 Inches",
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          Custom(
                            text: "Others",
                          ),
                          CustomTwo(
                            text: "9  Inches",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "50 Inches",
                            style:
                            TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Target",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "40%",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Actual",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "40%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
    );
  }
}

class Custom extends StatelessWidget {
  Custom({this.text});
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,style: TextStyle(fontSize: 18.0,
            color: Color(0XFF388E3C),fontWeight: FontWeight.bold),),
      ),
    );
  }
}

class CustomTwo extends StatelessWidget {
  CustomTwo({this.text});
  final text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,style: TextStyle(fontSize: 15),),
      ),
    );
  }
}