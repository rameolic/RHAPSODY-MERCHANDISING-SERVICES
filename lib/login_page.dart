import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/merchandiserdashboard.dart';
import 'package:merchandising/model/rememberme.dart';
import 'package:merchandising/HR/HRdashboard.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';
import 'api/HRapi/hrdashboardapi.dart';
import 'package:merchandising/api/FMapi/fmdbapi.dart';
import 'package:merchandising/main.dart';
import 'model/Location_service.dart';
import 'package:merchandising/api/empdetailsapi.dart';
import 'dart:async';
import 'model/database.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.

        }
      });
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailinputcontroller = TextEditingController();
  static TextEditingController passwordinputcontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).accentColor,
        body: Stack(
          children: [
            BackGround(),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.15,
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 20),
                          margin:
                              EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: transparentwhite,
                          ),
                          child: Form(
                            key: globalFormKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 20),
                                Hero(
                                  tag: 'logo',
                                  child: Image(
                                    height: 40,
                                    image: AssetImage('images/rmsLogo.png'),
                                  ),
                                ),
                                SizedBox(height: 40),
                                Container(
                                  color: Colors.white,
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  child: Theme(
                                    data: ThemeData(primaryColor: orange),
                                    child: TextFormField(
                                      controller: emailinputcontroller,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (input) => !input.contains('@')
                                          ? "Email Id should be valid"
                                          : null,
                                      cursorColor: grey,
                                      decoration: new InputDecoration(
                                        focusColor: grey,
                                        hintText: "Email Address",
                                        hintStyle: TextStyle(
                                          color: grey,
                                          fontSize: 16.0,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.person,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  color: Colors.white,
                                  child: Theme(
                                    data: ThemeData(primaryColor: orange),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: passwordinputcontroller,
                                      validator: (input) => input.length < 6
                                          ? "Password should be more than 6 characters"
                                          : null,
                                      obscureText: hidePassword,
                                      decoration: new InputDecoration(
                                        focusColor: grey,
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                          color: grey,
                                          fontSize: 16.0,
                                        ),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              hidePassword = !hidePassword;
                                            });
                                          },
                                          color: Theme.of(context)
                                              .accentColor
                                              .withOpacity(0.4),
                                          icon: Icon(hidePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                GestureDetector(
                                  onTap: () async {
                                    if (validateAndSave()) {
                                      setState(() {
                                        isApiCallProcess = true;
                                      });
                                      loginrequestdata.inputemail = emailinputcontroller.text;
                                      loginrequestdata.inputpassword =passwordinputcontroller.text;
                                      if (loginrequestdata.inputemail != null &&
                                          loginrequestdata.inputpassword != null) {
                                        if(rememberMe == true){
                                          addLogindetails();
                                        }
                                        int userroleid = await loginapi();
                                        currentuser.roleid = userroleid;
                                        if (userroleid == 6) {
                                          var DBMresult = await DBRequestmonthly();
                                          var DBDresult = await DBRequestdaily();
                                          await getLocation();
                                          await callfrequently();
                                          await getempdetails();
                                          await getproducts();
                                          const period = const Duration(seconds: 600);
                                          Timer.periodic(period, (Timer t) => getLocation());
                                          const time = const Duration(seconds: 900);
                                          Timer.periodic(time, (Timer t) => callfrequently());
                                          if (DBMresult != null && DBDresult != null) {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder:
                                                        (BuildContextcontext) =>
                                                            DashBoard()));
                                          }
                                        } else if(userroleid == 3){
                                          await getempdetails();
                                          int result = await HRdb();
                                          if(result != null){
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder:
                                                        // ignore: non_constant_identifier_names
                                                        (BuildContextcontext) =>
                                                        HRdashboard()));
                                          }
                                        } else if (userroleid == 5){
                                          await getFMdb();
                                          await getempdetails();
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContextcontext) =>
                                                          FieldManagerDashBoard()));
                                        }
                                        else {
                                          setState(() {
                                            isApiCallProcess = false;
                                          });
                                          final snackBar = SnackBar(
                                              elevation: 20.00,
                                              duration: Duration(seconds: 2),
                                              content: Text(
                                                "Username/password was wrong",
                                              ));
                                          scaffoldKey.currentState.showSnackBar(snackBar);
                                        }
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15.0),
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    color: orange,
                                    child: Center(
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 65.0,
                                        width: 30.0,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor:
                                                  Colors.white),
                                          child: Checkbox(
                                            value: rememberMe,
                                            onChanged:_onRememberMeChanged,
                                            activeColor: orange,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Remember me',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Spacer(
                                        flex: 7,
                                      ),
                                      Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
