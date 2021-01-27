import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'PlanogramcheckPhase2.dart';


class PlanogramCheckPhase3 extends StatefulWidget {
  @override
  _PlanogramCheckPhase3State createState() => _PlanogramCheckPhase3State();
}

class _PlanogramCheckPhase3State extends State<PlanogramCheckPhase3> {
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
                            PlanogramCheckPhase2()));}
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
                  margin: EdgeInsets.only(left: 10.0,right: 10.0),
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
                  margin: EdgeInsets.only(top: 10.0,right: 10.0,left: 10.0),
                  padding: EdgeInsets.all(8.0),
                  height: 50,
                  width: 415,
                  decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Item Code & Description",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                      Spacer(flex: 2),
                      Text(
                        "Qty",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                      Spacer(flex: 1),
                      Text(
                        "Expiry Date",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
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
