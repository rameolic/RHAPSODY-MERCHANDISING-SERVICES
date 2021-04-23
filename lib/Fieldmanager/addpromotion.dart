import 'package:flutter/material.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/availabitiy.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class AddPromotion extends StatefulWidget {
  @override
  _AddPromotionState createState() => _AddPromotionState();
}

String SelectedOutlet;

String Selectedproduct;
List<String> Outlets = ["a", "b", "c", "d", "e"];

class _AddPromotionState extends State<AddPromotion> {
  TextEditingController description = TextEditingController();
  GlobalKey<FormState> addpromotion = GlobalKey<FormState>();
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
          title: Text(
            'Add Promotion',
            style: TextStyle(color: orange),
          ),
        ),
        drawer: Drawer(
          child: Menu(),
        ),
        body: Stack(
          children: [
            BackGround(),
            Column(
              children: [
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
                    key: addpromotion,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          child: SearchableDropdown.single(
                            underline: SizedBox(),
                            isExpanded: true,
                            iconEnabledColor: orange,
                            iconSize: 25.0,
                            value: SelectedOutlet,
                            onChanged: (newVal) {
                              setState(() {
                                SelectedOutlet = newVal;
                              });
                            },
                            items: Outlets.map((String val) {
                              return new DropdownMenuItem<String>(
                                value: val,
                                child: new Text(val),
                              );
                            }).toList(),
                            hint: Text(
                              "Select Outlet",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          child: SearchableDropdown.single(
                            underline: SizedBox(),
                            isExpanded: true,
                            iconEnabledColor: orange,
                            iconSize: 25.0,
                            value: Selectedproduct,
                            onChanged: (newVal) {
                              setState(() {
                                Selectedproduct = newVal;
                              });
                            },
                            items: Outlets.map((String val) {
                              return new DropdownMenuItem<String>(
                                value: val,
                                child: new Text(val),
                              );
                            }).toList(),
                            hint: Text(
                              "Select Sku/item/product",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        StartDate(),
                        EndDate(),
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                          padding: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            maxLines: 3,
                            controller: description,
                            cursorColor: grey,
                            validator: (input) => !input.isNotEmpty
                                ? "Descripition not be empty"
                                : null,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusColor: orange,
                              hintText: "Descripition*",
                              hintStyle: TextStyle(
                                color: grey,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(10.00),
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

DateTime tomoroww = DateTime.now().add(Duration(days: 1));

DateTime Startdate = DateTime.now().add(Duration(days: 1));

class StartDate extends StatefulWidget {
  @override
  _StartDateState createState() => _StartDateState();
}

class _StartDateState extends State<StartDate> {
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: tomoroww,
      firstDate: tomoroww,
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
            dialogBackgroundColor: Colors.grey[100],
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != StartDate)
      setState(() {
        Startdate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          Text(
            "Start Date",
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Text(
            "${Startdate.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 16),
          ),
          IconButton(
            icon: Icon(CupertinoIcons.calendar),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
    );
  }
}


DateTime ENDdate = DateTime.now().add(Duration(days: 1));
class EndDate extends StatefulWidget {
  @override
  _EndDateState createState() => _EndDateState();
}

class _EndDateState extends State<EndDate> {
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: tomoroww,
      firstDate: tomoroww,
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
            dialogBackgroundColor: Colors.grey[100],
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != EndDate)
      setState(() {
        ENDdate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          Text(
            "End Date",
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Text(
            "${ENDdate.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 16),
          ),
          IconButton(
            icon: Icon(CupertinoIcons.calendar),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
    );
  }
}
