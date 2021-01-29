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
                OutletDetails(),
                Center(
                  child: Container(
                      decoration: BoxDecoration(color: Color(0xffFFDBC1),borderRadius: BorderRadius.circular(10)),
                    height: MediaQuery.of(context).size.height/3.5,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10,right: 10),
                    padding: EdgeInsets.only(left: 20),
                    child:
                    Image(
                      width: double.infinity,
                      image: AssetImage('images/planogram1.png'),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Color(0xffFFDBC1),borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.of(context).size.height/3.5,
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Before Image",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 35),
                          IconButton(icon:Icon(CupertinoIcons.camera,), onPressed: (){}),

                          Text("After Image",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(width: 90),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),

                            width: 180,
                            child: Image(
                              image: AssetImage('images/before.png'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),

                            width: 160,
                            child: Image(
                              image: AssetImage('images/after.png'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )

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
