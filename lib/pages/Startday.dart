import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Constants.dart';
import 'file:///C:/Users/ramkumar/StudioProjects/RHAPSODY-MERCHANDISING-SERVICES/lib/pages/Journeyplan.dart';
import 'home.dart';
class StartDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.all(
                      Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  return Container(
                    height: 220,
                    child: Column(
                      children: [
                        Text('Roll Call',style: TextStyle(color: orange,fontSize: 20),),
                        Divider(color: Colors.black,thickness: 0.8,),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Uniform and Hygiene'),
                            Spacer(),
                            Icon(CupertinoIcons.check_mark_circled_solid),
                            Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Hand Held Unit Charge'),
                            Spacer(),
                            Icon(CupertinoIcons.check_mark_circled_solid),
                            Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Transportation'),
                            Spacer(),
                            Icon(CupertinoIcons.check_mark_circled_solid),
                            Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('POSM'),
                            Spacer(),
                            Icon(CupertinoIcons.check_mark_circled_solid),
                            Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => JourneyPlan()));},
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
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));},
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
          color: Color(0xffFFDBC1),
          borderRadius: BorderRadius.circular(10.00),
        ),
        child: Text(
          'Start Day',
          style: TextStyle(color: Colors.black,fontSize: 15),
        ),
      ),
    );
  }
}

