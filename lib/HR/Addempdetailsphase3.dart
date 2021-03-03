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


class AddempPhase3 extends StatefulWidget {
  @override
  _AddempPhase3State createState() => _AddempPhase3State();
}

class _AddempPhase3State extends State<AddempPhase3> {
  GlobalKey<FormState> addempphase3 = GlobalKey<FormState>();

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
                  key: addempphase3 ,
                  child: Column(
                    children: [
                      Text("Documents Info",style: TextStyle(color: orange),),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0,top: 10.0),
                        padding: EdgeInsets.only(left:10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: department,
                          cursorColor: grey,
                          validator: (input) => !input.isNotEmpty
                              ? "Passport Number should not be empty"
                              : null,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusColor: orange,
                            hintText: "Passport Number (@required)",
                            hintStyle: TextStyle(
                              color: grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      PassportExpirydate(),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0,top: 10.0),
                        padding: EdgeInsets.only(left:10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: department,
                          cursorColor: grey,
                          validator: (input) => !input.isNotEmpty
                              ? "Visa Company should not be empty"
                              : null,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusColor: orange,
                            hintText: "Visa Company (@required)",
                            hintStyle: TextStyle(
                              color: grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
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
                              ? "Visa Number should not be empty"
                              : null,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusColor: orange,
                            hintText: "Visa Number (@required)",
                            hintStyle: TextStyle(
                              color: grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      visaExpirydate(),
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
                              ? "Mediacal Insurance should not be empty"
                              : null,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusColor: orange,
                            hintText: "Medical Insurance Number (@required)",
                            hintStyle: TextStyle(
                              color: grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      MedicalExpirydate(),
                      Center(
                        child: GestureDetector(
                          onTap: (){
                            validateform();

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
    final form = addempphase3.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

class visaExpirydate extends StatefulWidget {
  @override
  _visaExpirydateState createState() => _visaExpirydateState();
}

class _visaExpirydateState extends State<visaExpirydate> {
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
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.only(left:10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text("Visa Expiry Date",style: TextStyle(fontSize: 16),),
          Spacer(),
          Text("${StartDate.toLocal()}".split(' ')[0],
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



class PassportExpirydate extends StatefulWidget {
  @override
  _PassportExpirydateState createState() => _PassportExpirydateState();
}

class _PassportExpirydateState extends State<PassportExpirydate> {
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
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.only(left:10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text("Passport Expiry Date",style: TextStyle(fontSize: 16),),
          Spacer(),
          Text("${StartDate.toLocal()}".split(' ')[0],
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

class MedicalExpirydate extends StatefulWidget {
  @override
  _MedicalExpirydate createState() => _MedicalExpirydate();
}

class _MedicalExpirydate extends State<MedicalExpirydate> {
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
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.only(left:10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text("Insurance Expiry Date",style: TextStyle(fontSize: 16),),
          Spacer(),
          Text("${StartDate.toLocal()}".split(' ')[0],
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


