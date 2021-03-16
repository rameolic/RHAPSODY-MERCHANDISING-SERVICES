import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Constants.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:merchandising/api/FMapi/merchnamelistapi.dart';
import'package:merchandising/api/FMapi/storedetailsapi.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddJourneyPlan extends StatefulWidget {
  @override
  _AddJourneyPlanState createState() => _AddJourneyPlanState();
}

class _AddJourneyPlanState extends State<AddJourneyPlan> {
  String outlet_id;
  List<String> outlet = [];
  int dropDownValue = 1;
  bool pressschdlue = false;
  bool pressunschdle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("Add Journey Plan",style: TextStyle(color: orange),),
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
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                pressschdlue = true;
                                pressunschdle = false;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Center(
                                    child: Text(
                                      'Scheduled',
                                      style: TextStyle(
                                        color: pressschdlue == true
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  Icon(CupertinoIcons.triangle_fill,size: 12,color: Colors.white,),
                                ],
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white,width: 1.0),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: pressschdlue == true
                                    ? orange
                                    : Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                pressunschdle = true;
                                pressschdlue = false;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Center(
                                    child: Text(
                                      'Unscheduled',
                                      style: TextStyle(
                                        color: pressunschdle == false
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                  Icon(CupertinoIcons.triangle_fill,size: 12,color: Colors.white,),
                                ],
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white,width: 1.0),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: pressunschdle == true
                                    ? orange
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 5,bottom: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropDownField(
                          onValueChanged: (dynamic value) {
                            outlet_id = value;
                          },
                          value: outlet_id,
                          required: false,
                          hintText: 'Select Merchandiser',
                          items:  merchnamelist.firstname,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 5,bottom: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropDownField(
                          onValueChanged: (dynamic value) {
                            outlet_id = value;
                          },
                          value: outlet_id,
                          required: false,
                          hintText: 'Select Outlet',
                          items:  storesdata.storename,
                        ),
                      ),
                      pressschdlue == true ? schedulejp() :Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 5.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: StartDate(),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext
                                      context) =>
                                          FieldManagerDashBoard()));
                        },
                            child: Container(
                              margin: EdgeInsets.only(top: 5.0),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text("SAVE",style: TextStyle(color: Colors.white),))),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),



        ],
      ),

    );
  }
}
class StartDate extends StatefulWidget {
  @override
  _StartDateState createState() => _StartDateState();
}

class _StartDateState extends State<StartDate> {
  DateTime StartDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: StartDate,
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
    if (picked != null && picked != StartDate)
      setState(() {
        StartDate = picked;
      });
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("Select Date",style: TextStyle(fontSize: 16),),
          Spacer(),
          Text("${StartDate.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 16),),
          IconButton(
            icon: Icon(CupertinoIcons.calendar,size: 25),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),

    );
  }
}

class schedulejp extends StatefulWidget {
  @override
  _schedulejpState createState() => _schedulejpState();
}
List<String> months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
String selectedmonth;
List<String> weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
List<String> selectedweekday=[];
class _schedulejpState extends State<schedulejp> {
  @override
  Widget build(BuildContext context)  {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5,bottom: 10),
          padding: EdgeInsets.only(left:10.0,right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
          ),
          width: double.infinity,
          child: DropdownButton<String>(
              isExpanded: true,
              iconEnabledColor: orange,
              elevation: 20,
              dropdownColor: Colors.white,
              items: months.map((String val) {
                return new DropdownMenuItem<String>(
                  value: val,
                  child: new Text(val),
                );
              }).toList(),
              hint: Text("Please choose a Month"),
              value: selectedmonth,
              onChanged: (newVal) {
                setState(() {
                  selectedmonth = newVal;
                });
              })

        ),

        Container(
          margin: EdgeInsets.only(top: 5,bottom: 10),
          padding: EdgeInsets.only(left:10.0,right: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
          ),
          width: double.infinity,
          child: MultiSelectDialogField(
            title: Text('Select Day'),
            buttonText: Text('Select day\'s',style: TextStyle(fontSize: 15),),
            buttonIcon: Icon(Icons.arrow_drop_down,color: Colors.orange,),
            selectedColor: orange,
            items: weekdays.map((e) => MultiSelectItem(e, e.toString())).toList(),
            listType: MultiSelectListType.CHIP,
            onConfirm: (values) {
              selectedweekday = values;
              print(selectedweekday);
            },
          ),
        ),
      ],
    );
  }
}

