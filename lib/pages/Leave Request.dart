import 'package:flutter/material.dart';
import 'MenuContent.dart';
import '../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/pages/home.dart';

class LeaveRequest extends StatefulWidget {
  @override
  _LeaveRequestState createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  DateTime StratDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: StratDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.light(
            primary: orange,
            onPrimary: Colors.white,
            surface: orange,
            onSurface: Colors.black,
          ),
          dialogBackgroundColor:Colors.grey[100],
        ),
        child: child,
      );
    },
    );
    if (picked != null && picked != StratDate)
      setState(() {
        StratDate = picked;
      });
  }
  bool valuefirst = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Text(
              'Leave Request',
              style: TextStyle(color: orange),
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
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Start Date",style: TextStyle(fontSize: 16),),
                            Spacer(),
                            Text(
                              "${StratDate.toLocal()}".split(' ')[0],
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              icon: Icon(CupertinoIcons.calendar),
                              onPressed: () => _selectDate(context),
                            ),
                          ],
                        ),

                        Container(

                          child: EndDate(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [

                        Text("Leave Type",style: TextStyle(fontSize: 16),),
                        Spacer(),
                        LeaveReqDropDown(),


                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reason",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: "Type here",
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Container(
                      child:  Row(
                        children: [
                          Spacer(flex: 1),
                          Transform.scale(
                            scale: 0.8,
                            child: Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.deepOrange,
                              value: this.valuefirst,
                              onChanged: (bool value) {
                                setState(() {
                                  this.valuefirst = value;
                                });
                              },
                            ),
                          ),
                          Spacer(flex: 1),
                          Text("I accept the terms and conditions",style: TextStyle(fontSize: 16),),
                          Spacer(flex: 6),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      if( valuefirst == true ){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) => DashBoard()));
                      }
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(10.00),
                          ),
                          child: Text(
                            'Request Leave',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeaveReqDropDown extends StatefulWidget {
  @override
  _LeaveReqDropDownState createState() => _LeaveReqDropDownState();
}

class _LeaveReqDropDownState extends State<LeaveReqDropDown> {
  @override
  int dropDownValue = 0;
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        dropdownColor: Colors.white,
        value: dropDownValue,
        onChanged: (int newVal) {
          setState(() {
            dropDownValue = newVal;
          });
        },
        items:
            leaves.remainingleaves == 0 ?
            [
              DropdownMenuItem(
                value: 0,
                child: Text('Loss of Pay'),
              ),
            ]
            :
            [
              DropdownMenuItem(
                value: 0,
                child: Text('Loss of Pay'),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text('Sick Leave'),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text('Annual Leave'),
              ),
            ],
      ),
    );
  }
}
class EndDate extends StatefulWidget {
  @override
  _EndDateState createState() => _EndDateState();
}

class _EndDateState extends State<EndDate> {
  DateTime EndDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: EndDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.light(
            primary: orange,
            onPrimary: Colors.white,
            surface: orange,
            onSurface: Colors.black,
          ),
          dialogBackgroundColor:Colors.grey[100],
        ),
        child: child,
      );
    },
    );
    if (picked != null && picked != EndDate)
      setState(() {
        EndDate = picked;
      });
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("End Date",style: TextStyle(fontSize: 16),),
          Spacer(),
          Text("${EndDate.toLocal()}".split(' ')[0],
          style: TextStyle(fontSize: 16),),
          IconButton(
            icon: Icon(CupertinoIcons.calendar),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),

    );
  }
}
