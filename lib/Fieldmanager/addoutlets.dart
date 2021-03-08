import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Constants.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';

class AddOutlets extends StatefulWidget {
  @override
  _AddOutletsState createState() => _AddOutletsState();
}

class _AddOutletsState extends State<AddOutlets> {

  TextEditingController latitude = TextEditingController();

  TextEditingController longitude = TextEditingController();

  TextEditingController area = TextEditingController();

  TextEditingController city = TextEditingController();

  TextEditingController state = TextEditingController();
  GlobalKey<FormState> addoutlets = GlobalKey<FormState>();
  String outlet_id;
  List<String> outlet = [
    "Sheba Market",
    "Fair Mart ",
    "Al Quoz",
    "Umm Al Sheif ",
    "Anuragha",
    "Harish ",
    "Reliance Smart",
    "More Market",
    "Big Bazzar"
  ];
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
                                child: Expanded(
                                  child: DropDownField(
                                    onValueChanged: (dynamic value) {
                                      outlet_id = value;
                                    },
                                    value: outlet_id,
                                    required: false,
                                    hintText: 'Select Outlet',
                                    labelText: 'Outlet Name',
                                    items: outlet,
                                  ),
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
                            controller: state,
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
                            onTap: (){
                              if(validateform()){

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

/*class AddOutlets extends StatefulWidget {
  @override
  _AddOutletsState createState() => _AddOutletsState();
}

class _AddOutletsState extends State<AddOutlets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        title: Text(
          "Add Outlets",
          style: TextStyle(color: orange),
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
                      AddOutletData(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext
                            context) =>
                                Oulets()));
                  },
                      color: pink,
                      child: Text("ADD")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class AddOutletData extends StatefulWidget {
  @override
  _AddOutletDataState createState() => _AddOutletDataState();
}

class _AddOutletDataState extends State<AddOutletData> {
  String outlet_id;
  List<String> outlet = [
    "Sheba Market",
    "Fair Mart ",
    "Al Quoz",
    "Umm Al Sheif ",
    "Anuragha",
    "Harish ",
    "Reliance Smart",
    "More Market",
    "Big Bazzar"
  ];
  TextEditingController longitude = TextEditingController();
  TextEditingController latitude = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  GlobalKey<FormState> addoutlets = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: addoutlets,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),

              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/1.26,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Expanded(
                      child: DropDownField(
                        onValueChanged: (dynamic value) {
                          outlet_id = value;
                        },
                        value: outlet_id,
                        required: false,
                        hintText: 'Select Outlet',
                        labelText: 'Outlet Name',
                        items: outlet,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: longitude,
                      cursorColor: grey,
                      keyboardType: TextInputType.number,
                      validator: (input) => !input.isNotEmpty
                          ? "latitude should not be empty"
                          : null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Outlet Latitude',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: latitude,
                      cursorColor: grey,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Outlet Longitude',
                      ),

                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              height: 50,
              child: Row(
                children: [

                  Expanded(
                    child: TextField(
                      controller: area,
                      cursorColor: grey,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Outlet Area',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: city,
                      cursorColor: grey,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Outlet City',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: state,
                      cursorColor: grey,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Outlet State',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: country,
                      cursorColor: grey,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Outlet Country',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }

}*/





