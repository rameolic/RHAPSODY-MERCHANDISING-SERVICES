import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../Constants.dart';
import 'Customers Activities.dart';
import 'MenuContent.dart';

class VisibilityOne extends StatefulWidget {
  @override
  _VisibilityOneState createState() => _VisibilityOneState();
}

class _VisibilityOneState extends State<VisibilityOne> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Text(
              'Visibility',
              style: TextStyle(color: orange),
            ),
            Spacer(),
            SubmitButton(),
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
             OutletDetails(),
              Container(
                padding: EdgeInsets.all(10.00),
                margin: EdgeInsets.only(top: 10,right: 10,left: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      child:
                      Image(
                        image: AssetImage('images/tangjug.png'),
                      ),

                    ),
                    Column(
                      children: [
                        Text(
                          "Tang Display Gondalas ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Row(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Column(
                                children: [
                                  Text("Is Available"),
                                  VisibilitySwitchOne(),

                                ],
                              ),
                            ),
                            SizedBox(width: 10),

                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Capture Image"),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Image(
                                    width: 50,
                                    image: AssetImage('images/capture.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.photo_camera_solid,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),

                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.00),
                margin: EdgeInsets.only(top: 10,right: 10,left: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      child:
                      Image(
                        image: AssetImage('images/tangjug.png'),
                      ),

                    ),
                    Column(
                      children: [
                        Text(
                          "Tang Jug Shaped Display",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Row(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Column(
                                children: [
                                  Text("Is Available"),
                                  VisibilitySwitchOne(),

                                ],
                              ),
                            ),
                            SizedBox(width: 10),

                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text("Capture Image"),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Image(
                                    width: 50,
                                    image: AssetImage('images/capture.png'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.photo_camera_solid,
                        size: 30,
                      ),
                      onPressed: () {},
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

class VisibleOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height/2,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(10)),

    );
  }
}



class VisibilitySwitchOne extends StatefulWidget {
  @override
  _VisibilitySwitchOneState createState() => _VisibilitySwitchOneState();
}

class _VisibilitySwitchOneState extends State<VisibilitySwitchOne> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return  Column(
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
        isSwitched == true ? VisibilityDropDown() : SizedBox(width: 5,)
      ],
    );
  }
}

class VisibilityDropDown extends StatefulWidget {
  @override
  _VisibilityDropDownState createState() => _VisibilityDropDownState();
}

class _VisibilityDropDownState extends State<VisibilityDropDown> {
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

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    CustomerActivities()));
      },
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


