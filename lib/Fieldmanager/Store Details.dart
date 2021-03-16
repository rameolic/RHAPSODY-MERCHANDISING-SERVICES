import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/Fieldmanager/Add Store.dart';
import 'package:merchandising/api/FMapi/storedetailsapi.dart';

class StoreDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("Store Details",style: TextStyle(color: orange),),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          ListView.builder(
          shrinkWrap: true,
          itemCount: storesdata.storeaddress.length,
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
                    Text('Store Name : ${storesdata.storename[index]}',
                        style: TextStyle(
                            fontSize: 15.0,fontWeight: FontWeight.bold
                        )),
                    SizedBox(height: 5),
                    Text("Store Code : ${storesdata.storecode[index]}",
                      style: TextStyle(
                      fontSize: 14.0,
                    )),
                    SizedBox(height: 5),
                    Text('Contact Number : ${storesdata.storecontnum[index]}',
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                    SizedBox(height: 5),
                    Text('Address : ${storesdata.storeaddress[index]}',
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
                              AddStores()));
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
