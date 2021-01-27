import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'PlanogramcheckPhase2.dart';


class PlanogramCheckPhase1 extends StatefulWidget {
  @override
  _PlanogramCheckPhase1State createState() => _PlanogramCheckPhase1State();
}

class _PlanogramCheckPhase1State extends State<PlanogramCheckPhase1> {
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
