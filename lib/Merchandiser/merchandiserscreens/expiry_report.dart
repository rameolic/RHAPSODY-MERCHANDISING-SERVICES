
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'Customers Activities.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';
var productname = 'Dairy milk Silk';
var packtype = 'Regular';
double priceperpiece = 10.5;
double Estimatedvalue;
TextEditingController expirypeciescount = TextEditingController();
List<String>selectedList=[];
String Selectedtype = "SKU";
class ExpiryReport extends StatefulWidget {
  @override
  _ExpiryReportState createState() => _ExpiryReportState();
}

class _ExpiryReportState extends State<ExpiryReport> {
  String selecttype;
  static List selecttypelist  = ["SKU","ZREP","BAR CODE"].map((String val)
  {return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();

  String selectcode;
  static List barcodes  = ["2345643","6543167"," 9876512"].map((String val)
  {return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
  static List zrep  = ["23fca45ash643","65sa4dd3s1fcv67"," 9876sa5sa1S2"].map((String val)
  {return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
  static List sku  = ["sssad","asasas"," asasasdv"].map((String val)
  {return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();

  static List inputlist  = selectedList.map((String val)
  {return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Text(
              'Expiry Details',
              style: TextStyle(color: orange),
            ),
            Spacer(),
            SubmitButton(),
          ],
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
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:10.0),
                      padding: EdgeInsets.only(left:10.0),
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                      child: DropdownButton(
                        elevation: 0,
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        underline: Container(color: Colors.transparent),
                        iconEnabledColor: orange,
                        iconSize: 35.0,
                        value: selecttype,
                        onChanged: (newVal){
                          setState(() {
                            selecttype = newVal;
                            Selectedtype = newVal;
                            selectcode = null;
                            if(newVal == 'BAR CODE'){
                              inputlist = barcodes;
                            }else if(newVal == 'ZREP'){
                              inputlist= zrep;
                            }else{
                              inputlist = sku;
                            }
                          });
                        },
                        items: selecttypelist,
                        hint: Text("Filter By ",style: TextStyle(color: Colors.grey),),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top:10.0),
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10.0)),
                      child: SearchableDropdown.single(
                        underline: SizedBox(),
                        items: inputlist,
                        value: selectcode,
                        hint: "Select Product",
                        searchHint: "Select Product",
                        onChanged: (value) {
                          setState(() {
                            selectcode = value;
                          });
                        },
                        isExpanded: true,
                        iconEnabledColor: orange,
                        iconSize: 25.0,
                      ),
                    ),
                    selectcode == null?SizedBox() :Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Product : ",style: TextStyle(color: orange),),
                              Flexible(child: Text(productname,maxLines: 3,style: TextStyle(color: orange),)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Price per piece",style: TextStyle(color: orange),),
                              Text("$priceperpiece \$",style: TextStyle(color: orange),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Co-Pack/Regular ",style: TextStyle(color: orange),),
                              Text("$packtype",style: TextStyle(color: orange),),
                            ],
                          ),
                        ),
                      ],
                    ),
                    EndDate(),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.only(left:10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: expirypeciescount,
                        onChanged: (value){
                          setState(() {
                            Estimatedvalue = double.parse(expirypeciescount.text)*priceperpiece;
                          });
                        },
                        cursorColor: grey,
                        keyboardType: TextInputType.number,
                        validator: (input) => !input.isNotEmpty
                            ? "Department should not be empty"
                            : null,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusColor: orange,
                          hintText: "pieces count that are near to expiry",
                          hintStyle: TextStyle(
                            color: grey,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    expirypeciescount.text == null ?SizedBox() :Padding(
                      padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0),
                      child:
                      Estimatedvalue != null ?Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Estimated Expiry Value",style: TextStyle(color: orange),),
                          Text("$Estimatedvalue \$",style: TextStyle(color: orange),),
                        ],
                      ):SizedBox(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:10),
                      child: TextButton(onPressed: (){
                        if(selecttype!= null && selectcode!= null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      CustomerActivities()));
                        }else{
                          Flushbar(
                            message: selecttype==null?"Select type should not be null":"Select code should not be null",
                          )..show(context);
                        }

                      }, style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(orange)),
                          child: Text("SAVE",style: TextStyle(color: Colors.white),)),
                    )
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CustomerActivities()));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.00),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xffFFDBC1),
          borderRadius: BorderRadius.circular(10.00),
        ),
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}

class EndDate extends StatefulWidget {
  @override
  _EndDateState createState() => _EndDateState();
}

class _EndDateState extends State<EndDate> {
  DateTime tomoroww = DateTime.now().add(Duration(days: 1));
  DateTime ENDdate = DateTime.now().add(Duration(days: 1));
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
            "Expiry Date",
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