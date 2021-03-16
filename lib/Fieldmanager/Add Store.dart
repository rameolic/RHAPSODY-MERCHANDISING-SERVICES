import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';
import 'package:merchandising/HR/HRdashboard.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/api/FMapi/addstoresapi.dart';
import 'dart:async';


class AddStores extends StatefulWidget {
  @override
  _AddStoresState createState() => _AddStoresState();
}

class _AddStoresState extends State<AddStores> {

  TextEditingController storecode = TextEditingController();
  TextEditingController storename = TextEditingController();

  TextEditingController contactnumber = TextEditingController();

  TextEditingController address = TextEditingController();


  GlobalKey<FormState> addstores = GlobalKey<FormState>();
  String outlet_id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Row(
            children: [
              Text(
                'Add Stores',
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
                    key: addstores,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Container(

                          margin: EdgeInsets.only(bottom: 10.0,top: 10.0),
                          padding: EdgeInsets.only(left:10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: storecode,
                            cursorColor: grey,
                            validator: (input) => !input.isNotEmpty
                                ? "Store Code not be empty"
                                : null,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: "Store Code",
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
                            validator: (input) => !input.isNotEmpty
                                ? "Store Name should not be empty"
                                : null,
                            controller: storename,
                            cursorColor: grey,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: "Store Name ",
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
                            keyboardType: TextInputType.number,
                            controller: contactnumber,
                            cursorColor: grey,
                            validator: (input) => !input.isNotEmpty
                                ? "Contact Number should not be empty"
                                : null,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: "Contact Number ",
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
                            controller: address,
                            cursorColor: grey,
                            validator: (input) => !input.isNotEmpty
                                ? "Address should be valid"
                                : null,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: "Address",
                              hintStyle: TextStyle(
                                color: grey,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),

                        Center(
                          child: GestureDetector(
                            onTap: ()async{
                              if(validateform()== true){
                                setState(() {
                                  isApiCallProcess = true;
                                });
                                storedetails.storecode = storecode.text;
                                storedetails.storename = storename.text;
                                storedetails.contactnumber = contactnumber.text;
                                storedetails.address = address.text;
                                await addstoredetails();
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext
                                        context) =>
                                            FieldManagerDashBoard()));
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10,top: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text('SAVE'),
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
    );
  }

  bool validateform() {
    final form = addstores.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}