import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/pages/shareofshelf.dart';
import '../Constants.dart';
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
            SubmitButton(
              onpress: (){
                {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ShareShelf()));}
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
          Column(
            children: [
             OutletDetails(),
              Container(
                margin: EdgeInsets.only(top: 10,right: 10,left: 10),
                height:MediaQuery.of(context).size.height/4,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Tang Display Gondalas ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(width: 30),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Is Available"),
                                VisibilitySwitchOne(),


                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
                              children: [
                                Text("Capture Image"),
                                SizedBox(height: 50),

                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        SizedBox(height: 30),

                        IconButton(
                          icon: Icon(
                            CupertinoIcons.camera,
                            size: 40,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,right: 10,left: 10),
                padding: EdgeInsets.all(8),
                height:MediaQuery.of(context).size.height/4,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Tang Jug Shaped Display ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Is Available"),
                                VisibilitySwitchOne(),

                              ],
                            ),
                            SizedBox(width: 12),
                            Column(
                              children: [
                                Text("Reason"),
                                VisibilityDropDown(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        SizedBox(height: 20),

                        IconButton(
                          icon: Icon(
                            CupertinoIcons.camera,
                            size: 40,
                          ),
                          onPressed: () {},
                        ),
                      ],
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
    return  Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
          print(isSwitched);
        });
      },
      inactiveTrackColor: Colors.green,
      activeColor: Colors.red,
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
        dropdownColor: Colors.white,
        value: dropDownValue,
        onChanged: (int newVal){
          setState(() {
            dropDownValue = newVal;
          });
        },
        items: [
          DropdownMenuItem(
            value: 0,
            child: Text('DropDown1',style: TextStyle(
              fontSize: 14.0,
            ),),
          ),
          DropdownMenuItem(
            value: 1,
            child: Text('DropDown2',style: TextStyle(
                fontSize: 14.0),),
          ),
          DropdownMenuItem(
            value: 2,
            child: Text('DropDown3',style: TextStyle(
                fontSize: 14.0),),
          ),

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


