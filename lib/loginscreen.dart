import 'package:flutter/material.dart';
import 'Constants.dart';
import 'package:flutter/cupertino.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGround(),
          Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    TransparentContainer(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: LoginForm(),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),

                    Container(
                      height: 3,
                      width: 354,
                      color: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            'REGISTER HERE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isHidden = true;
  bool rememberMe = false;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildTextField("Username"),
          SizedBox(
            height: 20.0,
          ),
          buildTextField("Password"),
          SizedBox(
            height: 20.0,
          ),
          buildButtonContainer(),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 10.0,
                width: 10.0,
                child: Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.white),
                  child:Transform.scale(
                    scale: 0.7,
                    child: Checkbox(
                    value: rememberMe,
                    onChanged: _onRememberMeChanged,
                    activeColor: orange,
                  ),),
                ),
              ),
              Spacer(),
              Text(
                'Remember me',
                style: TextStyle(color: Colors.white,fontSize: 12),
              ),
              Spacer(flex: 7,),
              Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.white,fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Theme(
          data: ThemeData(primaryColor: orange),
          child: TextField(
            cursorColor: grey,
            decoration: InputDecoration(
              focusColor: grey,
              hintText: hintText,
              hintStyle: TextStyle(
                color: grey,
                fontSize: 16.0,
              ),
              prefixIcon: hintText == "Username" ? Icon(Icons.person) : Icon(Icons.lock),
              suffixIcon: hintText == "Password" ? IconButton(
                      onPressed: _toggleVisibility,
                      icon: _isHidden
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ) : null,
            ),
            obscureText: hintText == "Password" ? _isHidden : false,
          ),
        ),
      ),
    );
  }

  Widget buildButtonContainer() {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      },
      child: Container(
        height: 56.0,
        width: MediaQuery.of(context).size.width,
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
    );
  }
}


class TransparentContainer extends StatelessWidget {
  TransparentContainer({@required this.width, this.height, this.child});
  final width;
  final height;
  final child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 40.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: transparentwhite, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: orange.withOpacity(0.74),
            child: Icon(
              Icons.person,
              size: 45,
              color: Colors.white54,
            ),
          ),
          Text(
            'Sign In',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(
            height: 20.0,
          ),
          child,
        ],
      ),
    );
  }
}

