import 'package:flutter/material.dart';
import 'package:merchandising/pages/HQThree.dart';
import 'package:merchandising/pages/HQTwo.dart';
import 'HQTwo.dart';
import 'MenuContent.dart';
import '../Constants.dart';

class HQOne extends StatefulWidget {
  @override
  _HQOneState createState() => _HQOneState();
}

class _HQOneState extends State<HQOne> {
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
            children: [
              HQOneCustom(
                num: "25",
                monthyear: "March 2019",
                text1: "Month Target Details",
                text2: "Lorem ipsum Dollar sit Ameth",
                onpress: (){
                  {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              HQTwo()));}
                },
              ),
              HQOneCustom(
                num: "23",
                monthyear: "March 2019",
                text1: "Month Target Details",
                text2: "Lorem ipsum Dollar sit Ameth",
              ),
              HQOneCustom(
                num: "22",
                monthyear: "March 2019",
                text1: "Month Target Details",
                text2: "Lorem ipsum Dollar sit Ameth",
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 30, color: Colors.deepOrange),
        backgroundColor: Color(0xFFFFF3E0),
        onPressed: () {
          print("clicked");
        },
      ),
    );
  }
}

class HQOneCustom extends StatelessWidget {
  HQOneCustom({this.num, this.monthyear, this.text1, this.text2,this.onpress});
  final num;
  final monthyear;
  final text1;
  final text2;
  final onpress;


  @override
  Widget build(BuildContext context) {

    return Container(

      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: EdgeInsets.all(10),
      height: 70,
      width: 420,
      decoration: BoxDecoration(
          color: Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                num,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                    fontSize: 18),
              ),
              Text(
                monthyear,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: 50,
                width: 0.8,
                decoration: BoxDecoration(color: Colors.black),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  text1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Text(
                text2,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: Icon(Icons.keyboard_arrow_right,
                      size: 25.0, color: Colors.grey[600]),
                  onPressed:onpress),
            ],
          ),
        ],
      ),
    );
  }
}
