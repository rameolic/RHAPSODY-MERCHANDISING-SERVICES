import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/main.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:merchandising/model/requestandresponsemodel.dart';
import 'package:merchandising/Constants.dart';
import '../ProgressHUD.dart';
import 'home.dart';
import 'package:merchandising/ProgressHUD.dart';

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
        } else {
          // TODO: Forget the user
        }
      });
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  DashBoardRequestModel dashBoardRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailinputcontroller = TextEditingController();
  TextEditingController passwordinputcontroller = TextEditingController();
  static String userinputemail;
  static String userinputpassword;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
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
                                onTap: () {
                                  getLocation();
                                   userinputemail = emailinputcontroller.text;
                                    userinputpassword = passwordinputcontroller.text;
                                  if (validateAndSave()) {
                                    loginrequestdata.inputemail = userinputemail;
                                    loginrequestdata.inputpassword = userinputpassword;
                                    if (loginrequestdata.inputemail != null &&
                                        loginrequestdata.inputpassword !=
                                            null) {
                                      getDashBoardData();
                                      setState(() {
                                        isApiCallProcess = true;
                                      });
                                      new Future.delayed(
                                          const Duration(seconds: 5), () {
                                        if (DBResponsedata.Attendance != null) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContextcontext) =>
                                                          DashBoard()));
                                        } else {
                                          new Future.delayed(
                                              const Duration(seconds: 5), () {
                                            if (DBResponsedata.Attendance !=
                                                null) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder:
                                                          (BuildContextcontext) =>
                                                              DashBoard()));
                                            } else {
                                              setState(() {
                                                isApiCallProcess = false;
                                              });
                                              final snackBar = SnackBar(
                                                  elevation: 20.00,
                                                  duration:
                                                      Duration(seconds: 2),
                                                  content: Text(
                                                    "Username/password was wrong",
                                                  ));
                                              scaffoldKey.currentState
                                                  .showSnackBar(snackBar);
                                              new Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder:
                                                            (BuildContextcontext) =>
                                                                SplashScreen()));
                                              });
                                            }
                                          });
                                        }
                                      });
                                    }
                                  }
                                },
                                /* if (validateAndSave()) {
                                    print(loginRequestModel.toJson());

                                    setState(() {
                                      isApiCallProcess = true;
                                    });

                                    APIService apiService = new APIService();
                                    apiService
                                        .login(loginRequestModel)
                                        .then((value) {
                                      if (value != null) {
                                        setState(() {
                                          isApiCallProcess = false;
                                        });

                                        if (value.token.isNotEmpty) {
                                          print(value.token);
                                            if (value.Empid.isNotEmpty) {
                                              print(value.Empid);
                                              if (this.mounted) {
                                                setState(() {
                                                  dashBoardRequestModel
                                                      .empiddata = value.Empid;
                                                  APIDashBoard().tokendata = value.token;
                                                });
                                                print(APIDashBoard().tokendata);
                                              }
                                              print(dashBoardRequestModel
                                                  .toJson());
                                              APIDashBoard apidashboard =
                                              new APIDashBoard();
                                              apidashboard
                                                  .dashboard(
                                                  dashBoardRequestModel)
                                                  .then((value) {
                                                if (value != null) {
                                                  if (value.shedulevisits
                                                      .isNotEmpty) {
                                                    print(value.shedulevisits);
                                                    print(
                                                        value.unshedulevisits);
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                BuildContext
                                                                context) =>
                                                                DashBoard()));
                                                  }
                                                }
                                              });

                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                      context) =>
                                                          DashBoard()));
                                            }

                                        } else {
                                          final snackBar = SnackBar(
                                              elevation: 20.00,
                                              duration: Duration(seconds: 1),
                                              content: Text(
                                                "Username/password was wrong",
                                              ));
                                          scaffoldKey.currentState
                                              .showSnackBar(snackBar);
                                        }
                                      }
                                    });
                                  }
                                  getLocation();
                                },*/
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
                              SizedBox(height: 15),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 10.0,
                                      width: 10.0,
                                      child: Theme(
                                        data: ThemeData(
                                            unselectedWidgetColor:
                                                Colors.white),
                                        child: Transform.scale(
                                          scale: 0.7,
                                          child: Checkbox(
                                            value: rememberMe,
                                            onChanged: _onRememberMeChanged,
                                            activeColor: orange,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Remember me',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Spacer(
                                      flex: 7,
                                    ),
                                    Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
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
