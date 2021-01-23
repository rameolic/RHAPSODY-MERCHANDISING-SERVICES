import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'outletdetailes.dart';
import 'Customers Activities.dart';

class CheckIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  backgroundColor: Color(0xffE1E3E2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Builder(
                    builder: (context) {
                      // Get available height and width of the build area of this widget. Make a choice depending on the size.
                      return Container(
                        height: 101,
                        width: MediaQuery.of(context).size.width / 0.6,
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alert",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "It seems that you are not at the customer location. Do you want to do force check-in?",
                                  style: TextStyle(fontSize: 13.6)),
                              SizedBox(
                                height: 10.00,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  OutLet()));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Color(0xffAEB7B5),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      margin: EdgeInsets.only(right: 10.00),
                                      child: Center(child: Text("cancel")),
                                    ),
                                  ),
                                  ForceCheckin(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ));
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: pink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "Check In",
          style: TextStyle(
              fontSize: 16, color: orange, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ForceCheckin extends StatefulWidget {
  @override
  _ForceCheckinState createState() => _ForceCheckinState();
}

class _ForceCheckinState extends State<ForceCheckin> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  backgroundColor: Color(0xffE1E3E2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  content: Builder(
                    builder: (context) {
                      // Get available height and width of the build area of this widget. Make a choice depending on the size.
                      return Container(
                        height: 179,
                        width: MediaQuery.of(context).size.width / 0.6,
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Force check-In",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RoundCheckBOX(),
                              SizedBox(
                                height: 20,
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ));
      },
      child: Container(
        height: 40,
        width: 70,
        decoration: BoxDecoration(
          color: orange,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.only(left: 10.00),
        child: Center(
            child: Text(
          "yes",
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}

class RoundCheckBOX extends StatefulWidget {
  @override
  _RoundCheckBOXState createState() => _RoundCheckBOXState();
}

class _RoundCheckBOXState extends State<RoundCheckBOX> {
  bool gpsnotworking = false;
  bool geolocation = false;
  bool others = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              gpsnotworking = true;
              geolocation =false;
              others = false;
            });
          },
          child: Row(
            children: [
              ForcecheckinContent(
                child: gpsnotworking == true
                    ? Icon(
                  Icons.circle,
                  size: 15.0,
                  color: orange,
                )
                    : null,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "GPS Not Working",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              gpsnotworking = false;
              geolocation =true;
              others = false;
            });
          },
          child: Row(
            children: [
              ForcecheckinContent(
                child: geolocation == true
                    ? Icon(
                  Icons.circle,
                  size: 15.0,
                  color: orange,
                )
                    : null,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Geo Location",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              gpsnotworking = false;
              geolocation =false;
              others = true;
            });
          },
          child: Row(
            children: [
              ForcecheckinContent(
                child: others == true
                    ? Icon(
                  Icons.circle,
                  size: 15.0,
                  color: orange,
                )
                    : null,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "others",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: (){
              if (gpsnotworking == true) {
                print("gps not working");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CustomerActivities()));
              }
              else {
                if(geolocation == true){
                  print("geo Location was wrong");
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CustomerActivities()));
                }
                else {
                  if(others == true){
                    print("others");
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CustomerActivities()));
                  }
                  else{
                    null;
                  }
                }
              }
            },
            child: Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.only(right: 10.00),
              child: Center(child: Text("submit",style: TextStyle(color: Colors.white),)),
            ),
          ),
        ),
      ],
    );
  }
}

class ForcecheckinContent extends StatelessWidget {
  ForcecheckinContent({this.child});
  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 1.0),
          color: Colors.transparent),
      child: child,
    );
  }
}
