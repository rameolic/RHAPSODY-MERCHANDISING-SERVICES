import 'package:merchandising/api/api_service.dart';
import 'package:flutter/rendering.dart';
import 'package:merchandising/HR/HRdashboard.dart';
import 'package:merchandising/ProgressHUD.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'Customers Activities.dart';
import 'package:merchandising/model/database.dart';
var productname = "select from the above";
var packtype = 'Regular';
List<String>selectedList=[];
String selecttype;
String SelectedPeriod;
String selectpack;
 List selecttypelist  = ["SKU","ZREP","BAR CODE(CS)","BAR CODE(BS)","BAR CODE(PS)"].map((String val)
{return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
 List copack_regular  = ["Co-Pack","Regular"].map((String val)
{return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
List period  = ["P1","P2","P3","P4","P5","P6","P7","P8","P9","P10","P11","P12","P13","P14"].map((String val)
{return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
String selectcode;
 List barcodescs  = Expiry.barcode_cs.toSet().toList().map((String val)
{return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
 List barcodesps  = Expiry.barcode_ps.toSet().toList().map((String val)
{return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
 List barcodesbs  = Expiry.barcode_bs.toSet().toList().map((String val)
{return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
 List zrep  = Expiry.zrepcodes.toSet().toList().map((String val)
{return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
 List sku  = Expiry.sku.toSet().toList().map((String val)
{return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();

 List inputlist  = selectedList.map((String val)
{return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();


TextEditingController remarks = TextEditingController();


class ExpiryReport extends StatefulWidget {
  @override
  _ExpiryReportState createState() => _ExpiryReportState();
}

class _ExpiryReportState extends State<ExpiryReport> {
  bool isApiCallProcess = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: containerscolor,
            iconTheme: IconThemeData(color: orange),
            title: Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.menu),
                    SizedBox(width: 25,),
                    Text( 'Expiry Details',
                      style: TextStyle(color: orange),
                    ),
                  ],
                ),
                Spacer(),
                SubmitButton(),
              ],
            ),
          ),
          // drawer: Drawer(
          //   child: Menu(),
          // ),

          body: Stack(
            children: [
              BackGround(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 700,
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
                                  selectcode = null;
                                  if(newVal == 'BAR CODE(CS)'){
                                    inputlist = barcodescs;
                                  }else if(newVal == 'BAR CODE(BS)'){
                                    inputlist= barcodesbs;
                                  }else if(newVal == 'BAR CODE(PS)'){
                                    inputlist= barcodesps;
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
                                if(value != null){
                                  setState(() {
                                    isApiCallProcess = true;
                                  });
                                    if(inputlist == barcodescs){
                                      productname =  Expiry.sku[Expiry.barcode_cs.indexOf(value)];
                                      print(productname);
                                    }else if(inputlist == barcodesbs){
                                      productname =  Expiry.sku[Expiry.barcode_bs.indexOf(value)];
                                      print(productname);
                                    }else if(inputlist == barcodesps){
                                      productname =  Expiry.sku[Expiry.barcode_ps.indexOf(value)];
                                      print(productname);
                                    }else if(inputlist == zrep){
                                      productname =  Expiry.sku[Expiry.zrepcodes.indexOf(value)];
                                      print(productname);
                                    }else{
                                      productname =  value;
                                      print(productname);
                                    }
                                  setState(() {
                                    selectcode = value;
                                    isApiCallProcess = false;
                                  });
                                }
                              },
                              isExpanded: true,
                              iconEnabledColor: orange,
                              iconSize: 25.0,
                            ),
                          ),
                          Column(
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
                              // Padding(
                              //   padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text("Price per piece",style: TextStyle(color: orange),),
                              //       Text("$priceperpiece \$",style: TextStyle(color: orange),),
                              //     ],
                              //   ),
                              // ),
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
                                  value: selectpack,
                                  onChanged: (newVal){
                                    setState(() {
                                      selectpack = newVal;
                                    });
                                  },
                                  items: copack_regular,
                                  hint: Text("Select Pack ",style: TextStyle(color: Colors.grey),),
                                ),
                              ),
                            ],
                          ),
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
                              value: SelectedPeriod,
                              onChanged: (newVal){
                                setState(() {
                                  SelectedPeriod = newVal;
                                });
                              },
                              items: period,
                              hint: Text("select period",style: TextStyle(color: Colors.grey),),
                            ),
                          ),
                          EndDate(),
                          Expanded(
                            child: DefaultTabController(
                              length: 3, // length of tabs
                              initialIndex: 0,
                              child:Scaffold(
                                backgroundColor: Colors.transparent,
                                appBar: PreferredSize(
                                  preferredSize: Size.fromHeight(kToolbarHeight),
                                  child: Container(
                                        margin: EdgeInsets.fromLTRB(0, 10.0, 0.0, 0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          color: Colors.white,
                                        ),
                                        child: TabBar(
                                      //    controller: _controller,
                                          labelColor: orange,
                                          unselectedLabelColor: Colors.black,
                                          indicatorColor: orange,
                                          tabs: [
                                            Tab(text: 'Piece'),
                                            Tab(text: 'Box'),
                                            Tab(text: 'Cotton'),
                                          ],
                                        ),
                                      ),
                                ),
                                body: TabBarView(
                                  //physics: NeverScrollableScrollPhysics(),
                                   // controller: _controller,
                                    children: [
                                      Peice(),
                                      Box(),
                                      Cotton(),
                                    ]),
                              ),
                              ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            padding: EdgeInsets.only(left:10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: remarks,
                              cursorColor: grey,
                              keyboardType: TextInputType.number,
                              validator: (input) => !input.isNotEmpty
                                  ? "Department should not be empty"
                                  : null,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusColor: orange,
                                hintText: "remarks if any*",
                                hintStyle: TextStyle(
                                  color: grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(onPressed: ()async{
                      if(SelectedPeriod != null && selecttype!= null && selectcode!= null && packtype != null && "${ENDdate.toLocal()}".split(' ')[0] != "${tomoroww.toLocal()}".split(' ')[0]) {
                        print("correct");
                        Storecode = outletid;
                        productid = Expiry.id[Expiry.sku.indexOf(productname)];
                        packtypeselected=packtype;
                        expirypc = expirypeciescount.text ;
                         pcexpirydate = "${ENDdate.toLocal()}".split(' ')[0] ;
                         periodchoosed = SelectedPeriod;
                         exposureqntypc = quantity.text == "" ? 0: quantity.text;
                         pricepc = peiceprice.text== "" ? 0: peiceprice.text;
                         expirycs = cottonexpirypeciescount.text == "" ? 0: cottonexpirypeciescount.text;
                         csexpirydate = "${ENDdate.toLocal()}".split(' ')[0];
                         exposureqntycs = cottonquantity.text== "" ? 0: cottonquantity.text;
                         pricecs = cottonprice.text== "" ? 0: cottonprice.text;
                         expirybs = expiryBoxcount.text== "" ? 0: expiryBoxcount.text;
                         bsexpirydate = "${ENDdate.toLocal()}".split(' ')[0];
                         exposureqntybs = boxquantity.text== "" ? 0: boxquantity.text;
                         pricebs = boxprice.text== "" ? 0: boxprice.text;
                         filledby = '${DBrequestdata.receivedempid}';
                        remarksifany = remarks.text== "" ? 0: remarks.text;
                        if(Estimatedvalue == null && Estimatedboxvalue == null && Estimatedvaluecotton == null){
                          Flushbar(
                            message: "please fill atleast one of the three forms",
                            duration: Duration(seconds: 3),
                          )..show(context);
                        }else{
                          setState(() {
                            isApiCallProcess= true;
                          });
                          var result =await AddData();
                          if(result != null){
                            SelectedPeriod = null;
                            productname = "select from the above";
                            selectcode = null;
                            selecttype = null;
                            packtype = null;
                            period =null;
                            expirypeciescount.clear();
                            quantity.clear();
                            peiceprice.clear();
                            cottonexpirypeciescount.clear();
                            cottonquantity.clear();
                            cottonprice.clear();
                            expiryBoxcount.clear();
                            boxquantity.clear();
                            boxprice.clear();
                            remarks.clear();
                            setState(() {
                              isApiCallProcess= false;
                            });
                            Flushbar(
                              message: "data updated sucessfully",
                              duration: Duration(seconds: 3),
                            )..show(context);
                          }
                        }
                      }else{
                        Flushbar(
                          message: SelectedPeriod == null ? "Please select period" :selectcode==null ?"Selected item should not be null ":packtype== null? "PLease Select Pack":selecttype==null?"Select type should not be null":"please select a vaild product Expiry date",
                          duration: Duration(seconds: 3),
                        )..show(context);
                      }

                    }, style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(pink)),
                        child: Text("SAVE",style: TextStyle(color:orange),))
                  ],
                ),
              ),
            ],
          ),
        ),
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

DateTime tomoroww = DateTime.now().add(Duration(days: 1));

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

class Peice extends StatefulWidget {
  @override
  _PeiceState createState() => _PeiceState();
}
double priceperpiece;
double Estimatedvalue;
double Estimatedquantityvalue;
TextEditingController quantity = TextEditingController();
TextEditingController expirypeciescount = TextEditingController();
TextEditingController peiceprice = TextEditingController();
class _PeiceState extends State<Peice> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.only(left:10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: peiceprice,
            onChanged: (value){
              setState(() {
                priceperpiece = double.parse(peiceprice.text);

                expirypeciescount.text != null ? Estimatedvalue = double.parse(expirypeciescount.text)*priceperpiece :print("");
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
              hintText: "Enter price for each piece",
              hintStyle: TextStyle(
                color: grey,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
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
        //expirypeciescount.text == null ?SizedBox(height: 10,) :
        Padding(
          padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0,bottom: 10.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Estimated Expiry Value",style: TextStyle(color: orange),),
              Text("$Estimatedvalue AED",style: TextStyle(color: orange),),
            ],
          )
        ),
        Container(
          padding: EdgeInsets.only(left:10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: quantity,
            onChanged: (value){
              setState(() {
                Estimatedquantityvalue = double.parse(quantity.text)*priceperpiece;
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
              hintText: "Exposure quantity for peices",
              hintStyle: TextStyle(
                color: grey,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        //quantity.text == null ?SizedBox() :
        Padding(
          padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Estimated quantity Value",style: TextStyle(color: orange),),
              Text("$Estimatedquantityvalue AED",style: TextStyle(color: orange),),
            ],
          )
        ),
      ],
    );
  }
}

class Box extends StatefulWidget {
  @override
  _BoxState createState() => _BoxState();
}
double priceperbox;
double Estimatedboxvalue;
double Estimatedboxquantityvalue;
TextEditingController boxquantity = TextEditingController();
TextEditingController expiryBoxcount = TextEditingController();
TextEditingController boxprice = TextEditingController();
class _BoxState extends State<Box> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.only(left:10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: boxprice,
            onChanged: (value){
              setState(() {
                priceperbox = double.parse(boxprice.text);

                expiryBoxcount.text != null ? Estimatedboxvalue = double.parse(expiryBoxcount.text)*priceperbox :print("");
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
              hintText: "Enter price for each piece",
              hintStyle: TextStyle(
                color: grey,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.only(left:10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: expiryBoxcount,
            onChanged: (value){
              setState(() {
                Estimatedboxvalue = double.parse(expiryBoxcount.text)*priceperbox;
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
        //expirypeciescount.text == null ?SizedBox(height: 10,) :
        Padding(
            padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0,bottom: 10.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Estimated Expiry Value",style: TextStyle(color: orange),),
                Text("$Estimatedboxvalue AED",style: TextStyle(color: orange),),
              ],
            )
        ),
        Container(
          padding: EdgeInsets.only(left:10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: boxquantity,
            onChanged: (value){
              setState(() {
                Estimatedboxquantityvalue = double.parse(boxquantity.text)*priceperbox;
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
              hintText: "Exposure quantity for peices",
              hintStyle: TextStyle(
                color: grey,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        //quantity.text == null ?SizedBox() :
        Padding(
            padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Estimated quantity Value",style: TextStyle(color: orange),),
                Text("$Estimatedboxquantityvalue AED",style: TextStyle(color: orange),),
              ],
            )
        ),
      ],
    );
  }
}

class Cotton extends StatefulWidget {
  @override
  _CottonState createState() => _CottonState();
}
double pricepercotton;
double Estimatedvaluecotton;
double Estimatedcottonquantityvalue;
TextEditingController cottonquantity = TextEditingController();
TextEditingController cottonexpirypeciescount = TextEditingController();
TextEditingController cottonprice = TextEditingController();
class _CottonState extends State<Cotton> {

  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(left:10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: TextFormField(
          controller: cottonprice,
          onChanged: (value){
            setState(() {
              pricepercotton = double.parse(cottonprice.text);

              cottonexpirypeciescount.text != null ? Estimatedvaluecotton = double.parse(cottonexpirypeciescount.text)*pricepercotton :print("");
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
            hintText: "Enter price for each cotton",
            hintStyle: TextStyle(
              color: grey,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(left:10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: TextFormField(
          controller: cottonexpirypeciescount,
          onChanged: (value){
            setState(() {
              Estimatedvaluecotton = double.parse(cottonexpirypeciescount.text)*pricepercotton;
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
            hintText: "Cotton's count that are near to expiry",
            hintStyle: TextStyle(
              color: grey,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
      //expirypeciescount.text == null ?SizedBox(height: 10,) :
      Padding(
        padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0,bottom: 10.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Estimated Expiry Value",style: TextStyle(color: orange),),
            Text("$Estimatedvaluecotton AED",style: TextStyle(color: orange),),
          ],
        )
      ),
      Container(
        padding: EdgeInsets.only(left:10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: TextFormField(
          controller: cottonquantity,
          onChanged: (value){
            setState(() {
              Estimatedcottonquantityvalue = double.parse(cottonquantity.text)*pricepercotton;
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
            hintText: "Exposure quantity for cotton's",
            hintStyle: TextStyle(
              color: grey,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
      //quantity.text == null ?SizedBox() :
      Padding(
        padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Estimated quantity Value",style: TextStyle(color: orange),),
            Text("$Estimatedcottonquantityvalue AED",style: TextStyle(color: orange),),
          ],
      ),
    )
    ],
    );
  }
}

