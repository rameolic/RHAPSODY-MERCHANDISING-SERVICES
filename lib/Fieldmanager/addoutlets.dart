import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Constants.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:merchandising/HR/HRdashboard.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/api/FMapi/outletapi.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';
import 'package:merchandising/api/FMapi/addoutletapi.dart';

class AddOutlets extends StatefulWidget {
  @override
  _AddOutletsState createState() => _AddOutletsState();
}

class _AddOutletsState extends State<AddOutlets> {

  TextEditingController latitude = TextEditingController();

  TextEditingController longitude = TextEditingController();

  TextEditingController area = TextEditingController();

  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  GlobalKey<FormState> addoutlets = GlobalKey<FormState>();
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
                'Add Outlets',
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
                    key: addoutlets,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                         margin: EdgeInsets.only(top:10),
                          padding: EdgeInsets.all(10.0),

                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/1.26,
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
                                  items: store.addoutlet,
                                ),
                              )
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(bottom: 10.0,top: 10.0),
                          padding: EdgeInsets.only(left:10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: latitude,
                            cursorColor: grey,
                            validator: (input) => !input.isNotEmpty
                                ? "Latitude should not be empty"
                                : null,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: "Outlet latitude",
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
                                ? "Longitude should not be empty"
                                : null,
                            controller: longitude,
                            cursorColor: grey,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: "Outlet longitude",
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
                            controller: area,
                            cursorColor: grey,
                            validator: (input) => !input.isNotEmpty
                                ? "Outlet Area should not be empty"
                                : null,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: "Outlet Area",
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
                            controller: city,
                            cursorColor: grey,
                            validator: (input) => !input.isNotEmpty
                                ? "Outlet City should be valid"
                                : null,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: "Outlet City",
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
                            controller: state,
                            cursorColor: grey,
                            validator: (input) => !input.isNotEmpty
                                ? "Outlet State should be valid"
                                : null,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: "Outlet State",
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
                            controller: country,
                            cursorColor: grey,
                            validator: (input) => !input.isNotEmpty
                                ? "Outlet Country should not be empty"
                                : null,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: 'Outlet Country',
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
                             if(validateform()){
                               setState(() {
                                 isApiCallProcess = true;
                               });
                                for(int u=0;u<store.addoutlet.length;u++){
                                  if(store.addoutlet[u] == outlet_id){
                                      outletdetails.outletname =store.storeid[u];
                                  }
                                }
                                outletdetails.outletlat = latitude.text;
                                outletdetails.outletlong = longitude.text;
                                outletdetails.outletarea = outlet_id;
                                outletdetails.outletcity = city.text;
                                outletdetails.outletstate = state.text;
                                outletdetails.outletcountry = country.text;
                                await addoutletdetails();
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder:
                                            (BuildContextcontext) =>
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
    final form = addoutlets.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}