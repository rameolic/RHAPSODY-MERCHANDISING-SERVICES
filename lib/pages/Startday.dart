import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Constants.dart';
import 'Journeyplan.dart';
import 'home.dart';
import 'package:merchandising/model/distanceinmeters.dart';
import 'package:merchandising/api/journeyplanapi.dart';

class StartDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        todayjplists.distanceinmeters=[];
        distinmeters();
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: alertboxcolor,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(
                      Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Roll Call',style: TextStyle(color: orange,fontSize: 20),),
                        Divider(color: Colors.black,thickness: 0.8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Uniform and Hygiene'),
                            Spacer(),
                            Icon(CupertinoIcons.check_mark_circled_solid,color: orange,),
                            Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Hand Held Unit Charge'),
                            Spacer(),
                            Icon(CupertinoIcons.check_mark_circled_solid,color: orange,),
                            Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Transportation'),
                            Spacer(),
                            Icon(CupertinoIcons.check_mark_circled_solid,color: orange,),
                            Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('POSM'),
                            Spacer(),
                            Icon(CupertinoIcons.check_mark_circled_solid,color: orange,),
                            Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => JourneyPlan()));},
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: orange,borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(child: Text('ok',style: TextStyle(color: Colors.white))),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){Navigator.pop(context, MaterialPageRoute(builder: (BuildContext context) => DashBoard()));},
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(child: Text('Cancel',style: TextStyle(color: Colors.white))),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: orange,
          borderRadius: BorderRadius.circular(10.00),
        ),
        child: Text(
          'Start Day',
          style: TextStyle(color: Colors.white,fontSize: 15),
        ),
      ),
    );
  }
}

