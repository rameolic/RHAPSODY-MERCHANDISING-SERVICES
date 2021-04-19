import 'package:flutter/material.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Customers%20Activities.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'PlanogramcheckPhase2.dart';
import 'package:merchandising/model/camera.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:io';
import 'package:flutter/rendering.dart';

File beforeimage = File('dummy.txt');
File afterimage = File('dummy.txt');
String ontap;
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Planogram Check',
              style: TextStyle(color: orange),
            ),
            SubmitButton(
              onpress: (){
                {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                        CustomerActivities()));}
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
            child:SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutletDetails(),
                  Container(
                    decoration: BoxDecoration(color: pink,borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    width: double.infinity,
                    child:  FittedBox(
                      fit: BoxFit.fitWidth,
                      child: GestureDetector(
                        onTap: (){
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PreveiwScreen(
                                        input: afterimage,
                                      )));*/
                        },
                        child: Image(
                          image: AssetImage('images/planogram1.png'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: pink,borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Before Image",style: TextStyle(fontWeight: FontWeight.bold),),
                                IconButton(icon:Icon(CupertinoIcons.photo_camera_solid,), onPressed: (){
                                  Selectedscreen = "planogram";
                                  ontap = 'before';
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              TakePictureScreen(
                                              )));
                                }),
                              ],
                            ),
                            Container(
                              // ignore: unrelated_type_equality_checks
                              child: beforeimage.toString() !=
                                  'File: \'dummy.txt\''
                                  ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              PreveiwScreen(
                                                input: beforeimage,
                                              )));
                                },
                                child: SizedBox(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width/2.25,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image(
                                      image: FileImage(beforeimage),
                                    ),
                                  ),
                                ),
                              )
                                  : SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width/2.25,
                                child: FittedBox(
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage('images/capture.png'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("After Image",style: TextStyle(fontWeight: FontWeight.bold),),
                                IconButton(icon:Icon(CupertinoIcons.photo_camera_solid,), onPressed: (){
                                  Selectedscreen = "planogram";
                                  ontap = 'after';
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              TakePictureScreen(
                                              )));

                                }),
                              ],
                            ),
                            Container(
                              // ignore: unrelated_type_equality_checks
                              child: afterimage.toString()!=
                                  'File: \'dummy.txt\''
                                  ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              PreveiwScreen(
                                                input: afterimage,
                                              )));
                                },
                                child: SizedBox(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width/2.25,
                                  child:  FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image(
                                      image: FileImage(afterimage),
                                    ),
                                  ),
                                ),
                              )
                                  : SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width/2.25,
                                    child: FittedBox(
                                      child: Image(
                                        fit: BoxFit.fill,
                                image: AssetImage('images/capture.png'),
                              ),
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )

                ],
              ),
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




class PreveiwScreen extends StatelessWidget {
  PreveiwScreen({@required this.input});
  File input;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: [
          GestureDetector(
            onVerticalDragEnd: (details) {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: PhotoView(
                  loadingBuilder: (context, event) => Center(
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  imageProvider: FileImage(input)),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FloatingActionButton(
                  backgroundColor: pink,
                  child: Icon(Icons.check,size: 35,color: orange),
                  onPressed:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PlanogramCheckPhase1()));
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}
