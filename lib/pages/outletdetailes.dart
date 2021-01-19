import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'package:charts_flutter/flutter.dart' as charts;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              OutLetContainer(),
              SizedBox(height: 10,),
              OutLetContainer(

              ),
            ],
          ),
        ],
      ),

    );
  }
}
class OutLetContainer extends StatelessWidget {
  OutLetContainer({this.child});
  final child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 280,
        width: MediaQuery.of(context).size.width/1.05,
        decoration: BoxDecoration(
          color: pink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
        ),
    );
  }
}

class Task{
  String task;
  String taskValue;
  Color colour;

  Task(this.colour,this.task,this.taskValue);
}