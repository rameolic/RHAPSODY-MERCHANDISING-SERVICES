import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'PlanogramcheckPhase3.dart';


class PlanogramCheckPhase2 extends StatefulWidget {
  @override
  _PlanogramCheckPhase2State createState() => _PlanogramCheckPhase2State();
}

class _PlanogramCheckPhase2State extends State<PlanogramCheckPhase2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Text(
              'Planogram Check',
              style: TextStyle(color: orange),
            ),
            Spacer(),
            SubmitButton(
              onpress: (){
                {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PlanogramCheckPhase3()));}
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
            child:Column(
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
                  margin: EdgeInsets.only(top: 12.0),
                  padding: EdgeInsets.fromLTRB(10,10, 10, 10),
                  height: 250,
                  width: 415,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFF3E0),
                      borderRadius: BorderRadius.circular(10.0)),
                  child:
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("Tang Super Special Promo",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                color: Color(0XFFF57C00),fontSize: 15),),
                        ],
                      ),
                      Row(
                        children: [
                          Text(" 55245"),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("\n  Promotion Active",style: TextStyle(fontWeight: FontWeight.bold),),
                              PlanogramSwitch(),
                            ],
                          ),
                          Spacer(flex: 1),
                          Column(
                            children: [
                              Text("\n  Announcer Available",style: TextStyle(fontWeight: FontWeight.bold),),
                              PlanogramSwitch(),
                            ],
                          ),
                          Spacer(flex: 2),

                        ],
                      ),
                      Row(
                          children: [
                            Column(
                              children: [
                                Text("  Photograph",style: TextStyle(fontWeight: FontWeight.bold),),
                                Image.asset("assets/image/tang.jpg")
                              ],
                            ),
                            Spacer(),

                            Icon(CupertinoIcons.camera,size: 30.0,color: Color(0xFF388E3C),),
                          ]
                      ),

                    ],
                  ),

                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 20, 8, 0),
                  padding: EdgeInsets.all(8),
                  height: 170,
                  width: 415,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFF3E0),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Row(
                        children: [
                          Text(" Dettol April Promo",
                            style: TextStyle(fontWeight: FontWeight.bold,color: Color(0XFFF57C00)),),
                        ],
                      ),
                      Row(
                        children: [
                          Text(" 55665"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(flex: 1)
                          ,                    Column(
                            children: [
                              Text("Promotion Active",style: TextStyle(fontWeight: FontWeight.bold),),
                              PlanogramSwitch(),
                            ],
                          ),
                          SizedBox(width: 140),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:50.0),
                                child: Text("Reason",style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              PlanogramDropDown(),
                            ],
                          ),
                          Spacer(flex: 1),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PlanogramSwitch extends StatefulWidget {
  @override
  _PlanogramSwitchState createState() => _PlanogramSwitchState();
}

class _PlanogramSwitchState extends State<PlanogramSwitch> {
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
        ],
      ),
    );
  }
}

class PlanogramDropDown extends StatefulWidget {
  @override
  _PlanogramDropDownState createState() => _PlanogramDropDownState();
}

class _PlanogramDropDownState extends State<PlanogramDropDown> {
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
