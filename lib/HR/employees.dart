import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/HR/HRdashboard.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/availabitiy.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Leave Request.dart';
import 'package:merchandising/model/leaveresponse.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:merchandising/HR/addreport.dart';
import 'package:country_picker/country_picker.dart';
import 'Addempdetailsphase2.dart';
import 'package:merchandising/api/HRapi/empdetailsapi.dart';
import 'package:merchandising/api/HRapi/addemployeeapi.dart';
class EmployeeDetailes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Text(
              'Employees',
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
          ListView.builder(
              itemCount: employees.fullname.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
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
                            child: AutoSizeText(
                              '${employees.fullname[index]}',
                              maxLines: 1,
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
                          Text('Designation :',
                              style: TextStyle(
                                fontSize: 15.0,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(employees.rolename[index]),
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
                              AddEmployee()));
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

bool isgenderfemale =false;
bool isgendermale =true;
class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  String Selectedcountry;
  String selectedcountrycode;
  int designationdropdown = 0;
  TextEditingController firstname = TextEditingController();
  TextEditingController middlename = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobilenumber = TextEditingController();
  GlobalKey<FormState> addempphase1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: Scaffold(
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
                      key: addempphase1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Personal Details",style: TextStyle(color: orange),),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0,top: 10.0),
                            padding: EdgeInsets.only(left:10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: firstname,
                              cursorColor: grey,
                              validator: (input) => !input.isNotEmpty
                                  ? "First Name should not be empty"
                                  : null,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusColor: orange,
                                hintText: "First Name (@required)",
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
                              controller: middlename,
                              cursorColor: grey,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusColor: orange,
                                hintText: "Middle Name",
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
                              controller: lastname,
                              cursorColor: grey,
                              validator: (input) => !input.isNotEmpty
                                  ? "Last Name should not be empty"
                                  : null,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusColor: orange,
                                hintText: "Last Name (@required)",
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
                              controller: email,
                              cursorColor: grey,validator: (input) => !input.contains('@')
                                ? "Email Id should be valid"
                                : null,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusColor: orange,
                                hintText: "Email (@required)",
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Select Gender',style: TextStyle(
                                  color: grey,
                                  fontSize: 16.0,
                                ),),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isgenderfemale = true;
                                          isgendermale = false;
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 60,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Center(
                                              child: Text(
                                                'Female',
                                                style: TextStyle(
                                                  color: isgenderfemale == true
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                            Icon(CupertinoIcons.triangle_fill,size: 12,color: Colors.white,),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: orange,width: 1.0),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          color: isgenderfemale == true
                                              ? orange
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isgendermale = true;
                                          isgenderfemale = false;
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 70,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Center(
                                              child: Text(
                                                'Male',
                                                style: TextStyle(
                                                  color: isgendermale == false
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ),
                                            ),
                                            Icon(CupertinoIcons.triangle_fill,size: 12,color: Colors.white,),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: orange,width: 1.0),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          color: isgendermale == true
                                              ? orange
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  print('Select country: ${country.phoneCode}');
                                  setState(() {
                                    Selectedcountry = country.displayNameNoCountryCode;
                                    selectedcountrycode = country.phoneCode;
                                  });
                                },
                              );
                            },
                            child: Container(
                                margin: EdgeInsets.only(bottom: 10.0),
                                padding: EdgeInsets.only(left:10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                width: double.infinity,
                                height: 50,
                                child:
                                Selectedcountry == null ?
                                Center(child: Text('Select Country (@ required)',style: TextStyle(color: grey,fontSize: 16),))
                                    :
                                Center(child: Text(Selectedcountry,style: TextStyle(color: Colors.black,fontSize: 16),))
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width/6,
                                  height: 50,
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: selectedcountrycode != null ? Center(
                                    child: Text('+${selectedcountrycode}',style: TextStyle(color: Colors.black,fontSize: 16),),
                                  ) : SizedBox()
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width/1.4,
                                margin: EdgeInsets.only(bottom: 10.0),
                                padding: EdgeInsets.only(left:10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  controller: mobilenumber,
                                  cursorColor: grey,
                                  validator: (input) => !input.isNotEmpty
                                      ? "Mobile Number should not be empty"
                                      : null,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusColor: orange,
                                    hintText: "Mobile Number (@required)",
                                    hintStyle: TextStyle(
                                      color: grey,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: ()async{
                                if(validateform()){
                                  setState(() {
                                    isApiCallProcess = true;
                                  });
                                  employeedetails.gender = isgendermale == true ? "male":"female";
                                  employeedetails.firstname = firstname.text;
                                  employeedetails.middlename = middlename.text;
                                  employeedetails.surname = lastname.text;
                                  employeedetails.email = email.text;
                                  employeedetails.nationality = Selectedcountry;
                                  employeedetails.codes = selectedcountrycode;
                                  employeedetails.mobileno = mobilenumber.text;
                                  await getdesignations();
                                  setState(() {
                                    isApiCallProcess =false;
                                  });
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder:
                                              (BuildContextcontext) =>
                                              AddempPhase2()));
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
                  )
              )
            ],
          )
      ),
    );
  }

  bool validateform() {
    final form = addempphase1.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}





