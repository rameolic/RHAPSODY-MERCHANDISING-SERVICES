import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'addoutlets.dart';
import 'package:merchandising/api/FMapi/storedetailsapi.dart';
import 'package:merchandising/api/FMapi/outletapi.dart';


class Oulets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("Outlet Details",style: TextStyle(color: orange),),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          ListView.builder(
          shrinkWrap: true,
          itemCount: outletdata.outletname.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(bottom:5.0,left: 10.0,right: 10.0,top: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('[${outletdata.code[index]}] ${outletdata.outletname[index]}',
                        style: TextStyle(
                          fontSize: 14.0,fontWeight: FontWeight.bold
                        )),
                    SizedBox(height: 5),
                    Text('${outletdata.address[index]}'),
                    SizedBox(height: 5),
                    Text('Latitude : ${outletdata.outletlat[index].toString()}'),
                    SizedBox(height: 5),
                    Text('Longitude : ${outletdata.outletlong[index].toString()}'),
                    SizedBox(height: 5),
                    Text('Contact Number : ${outletdata.contactnumber[index].toString()}'),
                    SizedBox(height: 5),
                    Text('Location : ${outletdata.outletarea[index]},${outletdata.outletcity[index]},${outletdata.outletstate[index]},${outletdata.outletcountry[index]}',
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                  ],
                ));
          }),
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
                              AddOutlets()));
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
