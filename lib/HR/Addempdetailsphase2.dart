import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/availabitiy.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Leave Request.dart';
import 'package:merchandising/model/leaveresponse.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:merchandising/HR/addreport.dart';
import 'package:country_picker/country_picker.dart';
import 'Addempdetailsphase3.dart';
import 'package:merchandising/api/HRapi/addemployeeapi.dart';
import 'package:intl/intl.dart';
String selecteddesignation;
class AddempPhase2 extends StatefulWidget {
  @override
  _AddempPhase2State createState() => _AddempPhase2State();
}

class _AddempPhase2State extends State<AddempPhase2> {
  int designationdropdown = 0;
  GlobalKey<FormState> addempphase2 = GlobalKey<FormState>();

  TextEditingController department = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Row(
            children: [
              Text(
                'Add Employee',
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
                  child: Form(
                    key: addempphase2 ,
                    child: Column(
                      children: [
                        Text("Professional Details",style: TextStyle(color: orange),),
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0,top: 10.0),
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
                              items: rolenames.designation.map((String val) {
                                return new DropdownMenuItem<String>(
                                  value: val,
                                  child: new Text(val),
                                );
                              }).toList(),
                              hint: Text("Select Designation (@required)"),
                              value: selecteddesignation,
                              onChanged: (newVal) {
                                setState(() {
                                  selecteddesignation = newVal;
                                });
                              })

                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0),
                          padding: EdgeInsets.only(left:10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: department,
                            cursorColor: grey,
                            validator: (input) => !input.isNotEmpty
                                ? "Department should not be empty"
                                : null,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: "Department (@required)",
                              hintStyle: TextStyle(
                                color: grey,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                        Joiningdate(),
                        Center(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder:
                                          (BuildContextcontext) =>
                                          AddempPhase3()));
                              if(validateform() && selecteddesignation != null){
                                for(int u=0;u<rolenames.designation.length;u++){
                                  if (rolenames.designation[u] == selecteddesignation) {
                                    employeedetails.designation = rolenames.id[u];
                                  }}
                                employeedetails.departmant = department.text;
                                employeedetails.joiningdate = DateFormat('yyyy-MM-dd').format(joiningdate);
                                print(employeedetails.designation);
                                print(employeedetails.departmant);
                                print(employeedetails.joiningdate);

                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10,top: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text('Next'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
          ],
        )
    );
  }
  bool validateform() {
    final form = addempphase2.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}


class Joiningdate extends StatefulWidget {
  @override
  _JoiningdateState createState() => _JoiningdateState();
}
DateTime joiningdate = DateTime.now();
class _JoiningdateState extends State<Joiningdate> {
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: joiningdate,
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
    if (picked != null && picked != joiningdate)
      setState(() {
        joiningdate = picked;
      });
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.only(left:10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text("Joining Date",style: TextStyle(fontSize: 16),),
          Spacer(),
          Text("${joiningdate.toLocal()}".split(' ')[0],
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
