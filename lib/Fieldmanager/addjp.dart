import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Constants.dart';
import 'journeyplan.dart';
import 'package:dropdownfield/dropdownfield.dart';


class AddJourneyPlan extends StatelessWidget {
  String outlet_id;
  List<String> outlet = [
    "Sheba Super Market",
    "Fair Mart Super Market",
    "Al Quoz Market",
    "Umm Al Sheif Super Marker",
    "Anuragha Super Market",
    "Harish Food Zone",
    "Reliance Smart",
    "More Super Market",
    "Big Bazzar"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("Add Journey Plan",style: TextStyle(color: orange),),
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
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
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
                            hintText: 'Select Merchandiser',
                            items: outlet,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
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
                            hintText: 'Type',

                            items: outlet,
                          ),
                        ),
                      ),


                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
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
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: StartDate(),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext
                      context) =>
                          FMJouneyplan()));
            },
                child: Text("SAVE")),
          ),

        ],
      ),
    );
  }
}
class StartDate extends StatefulWidget {
  @override
  _StartDateState createState() => _StartDateState();
}

class _StartDateState extends State<StartDate> {
  DateTime StartDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: StartDate,
      firstDate: DateTime(2015, 8),
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
            dialogBackgroundColor:Colors.grey[100],
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != StartDate)
      setState(() {
        StartDate = picked;
      });
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("Select Date",style: TextStyle(fontSize: 16),),
          Spacer(),
          Text("${StartDate.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 16),),
          IconButton(
            icon: Icon(CupertinoIcons.calendar,size: 25),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),

    );
  }
}


