import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/ramkumar/StudioProjects/RHAPSODY-MERCHANDISING-SERVICES/lib/pages/MenuContent.dart';
class OutLet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Text(
          'Outlet Details',
          style: TextStyle(color: orange),
        ),
      ),
      drawer: Drawer(
        child: Menu(),
      ),
      body: Stack(
        children: [
          BackGround(),
          Column(
            children: [
              SizedBox(height: 10,),
             OutLetContainer(),
              SizedBox(height: 10,),
              OutLetContainer(),

            ],
          )
        ],
      ),

    );
  }
}
class OutLetContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: pink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(height: 280,width: MediaQuery.of(context).size.width/1.05,
        ),
      ),
    );
  }
}

