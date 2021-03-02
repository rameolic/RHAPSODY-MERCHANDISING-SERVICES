import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'package:merchandising/Constants.dart';
import 'SurveyOne.dart';
import 'SurveyTwo.dart';

class OutletSurveySubmit extends StatefulWidget {
  @override
  _OutletSurveySubmitState createState() => _OutletSurveySubmitState();
}

class _OutletSurveySubmitState extends State<OutletSurveySubmit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Text(
          'Outlet Survey',
          style: TextStyle(color: orange),
        ),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutletDetails(),
              OSContainer(
                text1: "Survey One",
                text2: "Pending",
                text2color: Colors.red,
                onpress: () {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SurveyOne()));
                  }
                },
              ),
              OSContainer(
                  text1: "Suervey Two",
                  text2: "Complete",
                  text2color: Colors.green,
                  onpress: () {
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SurveyTwo()));
                    }
                  }),
              OSContainer(
                text1: "Survey Three",
                text2: "Pending",
                text2color: Colors.red,
                onpress: () {
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SurveyTwo()));
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OSContainer extends StatelessWidget {
  OSContainer({this.text1, this.text2, this.text2color, this.onpress});
  final text1;
  final text2;
  final text2color;
  final onpress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10,right: 10,left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text1,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(text2,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: text2color)),
            ],
          ),
          IconButton(
              onPressed: onpress, icon: Icon(Icons.keyboard_arrow_right)),
        ],
      ),
    );
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
        margin: EdgeInsets.only(right: 10.00),
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





