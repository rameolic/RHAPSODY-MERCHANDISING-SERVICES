import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:merchandising/HR/addreport.dart';
import 'package:merchandising/api/HRapi/empdetailsforreportapi.dart';


class Reportingemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("Reporting",style: TextStyle(color: orange),),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          ListView.builder(
              itemCount: reporting.merchandisers.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 120,
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
                          Flexible(
                            child: AutoSizeText(reporting.merchandisers[index],
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
                          Text('reporting to:',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(reporting.feildmanager[index],
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text('Start Date :',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(reporting.startdate[index],
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text('End Date :',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text('${reporting.enddate[index]}',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              }
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext
                          context) =>
                              addreporting()));
                },
                backgroundColor: pink,
                elevation: 8.0,
                child: Icon(Icons.add,color: orange,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


