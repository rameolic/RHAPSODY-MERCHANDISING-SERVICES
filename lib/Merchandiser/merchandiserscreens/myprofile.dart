import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/api/empdetailsapi.dart';
import 'package:flushbar/flushbar.dart';
import 'package:merchandising/model/rememberme.dart';

class Myprofile extends StatefulWidget {
  @override
  _MyprofileState createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  void initState() {
    ischatscreen = 0;
    print('chatscreen fromprofile = $ischatscreen');
  }
  TextEditingController currentpasswordcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController newpasswordv2controller = TextEditingController();
  TextEditingController mobilenumbercontroller = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Row(
            children: [
              Text(
                'My Profile',
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
              child: Column(
                children: [
                  SizedBox(height: 30),
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius:40,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.00),
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: Icon(Icons.person,color: orange,size: 60,),
                             // Image(image: AssetImage('images/capture.png'))
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DBrequestdata.empname,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("."),
                      Text(
                        DBrequestdata.receivedempid,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Personal Info",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        margin: EdgeInsets.all(10.0),
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Full Name:",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    Text(' '),
                                    Text(" "),
                                    Text(DBrequestdata.empname),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "E-mail :",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(DBrequestdata.emailid),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Joining Date :",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(myprofile.joiningdate),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Department :",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(myprofile.department),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Nationality :",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(myprofile.nationality),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Visa Company Info :",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(child: Text(myprofile.visacompanyname)),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Visa Expiry date :",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(myprofile.visaexpirydate),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Passport Expiry date :",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(myprofile.passportexpirydate),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Employee Score :",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(myprofile.employeescore.toString()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Update Info",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        height: 80,
                        padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        margin: EdgeInsets.all(10.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Mobile Number :",
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(myprofile.mobilenumber),
                                Spacer(),
                               /* GestureDetector(
                                  child: Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                              backgroundColor: alertboxcolor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                              content: Builder(
                                                builder: (context) {
                                                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                                  return SizedBox(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "change MobileNumber",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 10.00,
                                                        ),
                                                        Theme(
                                                          data: ThemeData(
                                                              primaryColor:
                                                                  orange),
                                                          child: TextFormField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .phone,
                                                            decoration:
                                                                new InputDecoration(
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              focusedBorder:
                                                                  InputBorder
                                                                      .none,
                                                              enabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              errorBorder:
                                                                  InputBorder
                                                                      .none,
                                                              disabledBorder:
                                                                  InputBorder
                                                                      .none,
                                                              focusColor: grey,
                                                              hintText:
                                                                  "New Mobile Number",
                                                              hintStyle:
                                                                  TextStyle(
                                                                color: grey,
                                                              ),
                                                              prefixIcon: Icon(
                                                                Icons.phone,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10.00,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {},
                                                              child: Container(
                                                                height: 40,
                                                                width: 70,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: orange,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            10.00),
                                                                child: Center(
                                                                    child: Text(
                                                                  "Submit",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ));
                                  },
                                ), */
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Change Password",
                                ),
                                Spacer(),
                                GestureDetector(
                                  child: Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                              backgroundColor: alertboxcolor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                              content: Builder(
                                                builder: (context) {
                                                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                                  return Form(
                                                    key: globalFormKey,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Change Password",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 10.00,
                                                        ),
                                                        Theme(
                                                          data: ThemeData(
                                                              primaryColor:
                                                                  orange),
                                                          child: TextFormField(
                                                            controller:
                                                                currentpasswordcontroller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            validator: (input) =>
                                                                input.length < 6
                                                                    ? "Password should be more than 6 characters"
                                                                    : null,
                                                            obscureText: true,
                                                            decoration:
                                                                new InputDecoration(
                                                              focusColor: grey,
                                                              hintText:
                                                                  "Current Password",
                                                              hintStyle:
                                                                  TextStyle(
                                                                color: grey,
                                                              ),
                                                              prefixIcon: Icon(
                                                                Icons.lock,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Theme(
                                                          data: ThemeData(
                                                              primaryColor:
                                                                  orange),
                                                          child: TextFormField(
                                                            controller:
                                                                newpasswordcontroller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            validator: (input) =>
                                                                input.length < 6
                                                                    ? "Password should be more than 6 characters"
                                                                    : null,
                                                            obscureText: true,
                                                            decoration:
                                                                new InputDecoration(
                                                              focusColor: grey,
                                                              hintText:
                                                                  "New Password",
                                                              hintStyle:
                                                                  TextStyle(
                                                                color: grey,
                                                              ),
                                                              prefixIcon: Icon(
                                                                Icons.lock,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Theme(
                                                          data: ThemeData(
                                                              primaryColor:
                                                                  orange),
                                                          child: TextFormField(
                                                            controller:
                                                                newpasswordv2controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            validator: (input) =>
                                                                input.length < 6
                                                                    ? "Password should be more than 6 characters"
                                                                    : null,
                                                            obscureText: true,
                                                            decoration:
                                                                new InputDecoration(
                                                              focusColor: grey,
                                                              hintText:
                                                                  "Confrim new Password",
                                                              hintStyle:
                                                                  TextStyle(
                                                                color: grey,
                                                              ),
                                                              prefixIcon: Icon(
                                                                Icons.lock,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10.00,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                print(userpassword.password);
                                                                if (validateAndSave()) {
                                                                  if(userpassword.password == currentpasswordcontroller.text) {
                                                                   if(newpasswordcontroller.text == newpasswordv2controller.text){
                                                                     print("send password to api");
                                                                     change.password = newpasswordcontroller.text;
                                                                     Navigator.pop(context, MaterialPageRoute(builder: (BuildContextcontext) => Myprofile()));
                                                                     Flushbar(
                                                                       message: "password Updated",
                                                                       duration:  Duration(seconds: 3),
                                                                     )..show(context);
                                                                     changepassword();
                                                                     userpassword.password = newpasswordcontroller.text;
                                                                     currentpasswordcontroller.clear();
                                                                     newpasswordcontroller.clear();
                                                                     newpasswordv2controller.clear();
                                                                     removeValues();
                                                                     print(userpassword.password);
                                                                   }
                                                                   else{
                                                                     Flushbar(
                                                                       message:  "password's didn't match",
                                                                       duration:  Duration(seconds: 3),
                                                                     )..show(context);

                                                                   }
                                                                  }else{
                                                                    Flushbar(
                                                                      message:  "current password was wrong",
                                                                      duration:  Duration(seconds: 3),
                                                                    )..show(context);
                                                                  }
                                                                }
                                                              },
                                                              child: Container(
                                                                height: 40,
                                                                width: 70,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: orange,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            10.00),
                                                                child: Center(
                                                                    child: Text(
                                                                  "Submit",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
