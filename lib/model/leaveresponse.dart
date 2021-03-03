import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:photo_view/photo_view.dart';

class ResponsetoLeave extends StatefulWidget {
  @override
  _ResponsetoLeaveState createState() => _ResponsetoLeaveState();
}

class _ResponsetoLeaveState extends State<ResponsetoLeave> {

 static final List<String> leavereason = <String>["Outletname","Outletname",];
 static final List<String> startdate = <String>["checkintime","Outletname",];
 static final List<String> enddate = <String>["Outletname","Outletname",];
 static final List<String> type = <String>["Outletname","Outletname",];

  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Row(
            children: [
              Text(
                'Leave Response',
                style: TextStyle(color: orange),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Menu(),
        ),
        body: Stack(children: [
          BackGround(),
          ListView.builder(
              itemCount: leavereason.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      isApiCallProcess = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext
                            context) =>
                                leaveresult()));
                    setState(() {
                      isApiCallProcess = false;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Reason :',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: AutoSizeText(
                                '${leavereason[leavereason.length - 1 -index]}',
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Leave Type:',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${type[type.length - 1 -index]}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('total number of days',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text('2',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Employee name :',
                                style: TextStyle(
                                  fontSize: 15.0,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text("ram"),
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                );
              }
          ),
        ]));
  }
}


  class leaveresult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("Leave Response",style: TextStyle(color: orange),),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Reason :',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: AutoSizeText(
                              "Reason"
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('Leave Type:',
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text('type',
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('total number of days',
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                          Text('2',
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('Employee name :',
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text("ram"),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('Employee ID :',
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text("EMP55266"),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('Start Date :',
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text("10-12-12"),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('End date :',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text("15-12-20"),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text('Requested on :',
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text("25-12-20"),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Supported Documents :',
                              style: TextStyle(
                                fontSize: 16.0,
                              )),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext
                                      context) =>
                                          VeiwImage()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text("Veiw"),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext
                                context) =>
                                    ResponsetoLeave()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Reject Leave",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext
                                context) =>
                                    ResponsetoLeave()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Accept Leave",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
class VeiwImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: PhotoView(
        imageProvider: AssetImage("images/rmsLogo.png"),
      ),
    );
  }
}



