import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/api/FMapi/add_categoryapi.dart';


class CategoryofProducts extends StatefulWidget {
  @override
  _CategoryofProductsState createState() => _CategoryofProductsState();
}

class _CategoryofProductsState extends State<CategoryofProducts> {
  TextEditingController typecategory = TextEditingController();
  GlobalKey<FormState> addcategories = GlobalKey<FormState>();

  bool isApiCallProcess = false;

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
              'Add Category',
              style: TextStyle(color: orange),
            ),
          ],
        ),
      ),
      // drawer: Drawer(
      //   child: Menu(),
      // ),
      body: Stack(
        children:[
          BackGround(),
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: pink,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Form(
                  key: addcategories,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.only(left:10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: typecategory,
                          cursorColor: grey,
                          validator: (input) => !input.isNotEmpty
                              ? "add category should not be empty"
                              : null,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusColor: orange,
                            hintText: "Enter Category",
                            hintStyle: TextStyle(
                              color: grey,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 80),

                      TextButton(onPressed: ()async{
                        if (validateform() == true)
                        setState(() {
                          isApiCallProcess = true;
                        });
                        CategorytoAdd.name = typecategory.text;

                        await addcategory();

                        setState(() {
                          isApiCallProcess = false;
                        });

                         { Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FieldManagerDashBoard()));}

                                      },
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(orange)),
                          child: Text("SAVE",style: TextStyle(color: Colors.white),)),
                    ],
                  ),
                ),

              ),
            ],
          ),
        ]
      ),

    ));
  }
  bool validateform() {
    final form = addcategories.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
