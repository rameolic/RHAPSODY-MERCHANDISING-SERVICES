import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Constants.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'package:merchandising/api/FMapi/add_brandapi.dart';
import 'package:merchandising/api/FMapi/category_detailsapi.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:merchandising/ProgressHUD.dart';
import 'package:merchandising/Fieldmanager/FMdashboard.dart';
import 'package:merchandising/api/FMapi/addproduct_api.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/FMapi/brand_detailsapi.dart';
import 'package:merchandising/Fieldmanager/add_category.dart';


String image;

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isApiCallProcess = false;

  TextEditingController sku = TextEditingController();
  TextEditingController productname = TextEditingController();
  TextEditingController piecepercartoon = TextEditingController();
  TextEditingController zrepcode = TextEditingController();
  TextEditingController priceperpiece = TextEditingController();
  TextEditingController remarks = TextEditingController();

  GlobalKey<FormState> productdetails = GlobalKey<FormState>();


  FilePickerResult _file;
  Future getFile() async {
    FilePickerResult file = await FilePicker.platform.pickFiles();
    setState(() {
      _file = file;
    });
    return _file;
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: containerscolor,
              iconTheme: IconThemeData(color: orange),
              title: Text(
                'Add Products',
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
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(color: pink,
                    borderRadius: BorderRadius.circular(10.0)),
                    child: Form(
                      key: productdetails,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: sku,
                              cursorColor: grey,
                              validator: (input) => !input.isNotEmpty
                                  ? "SKU should not be empty"
                                  : null,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusColor: orange,
                                hintText: "Enter SKU",
                                hintStyle: TextStyle(
                                  color: grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 10.0),
                            padding: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: productname,
                              cursorColor: grey,
                              validator: (input) => !input.isNotEmpty
                                  ? "product name should not be empty"
                                  : null,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusColor: orange,
                                hintText: "Enter product name",
                                hintStyle: TextStyle(
                                  color: grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          SelectBrandname(),
                          Container(
                            margin: EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 10.0),
                            padding: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: piecepercartoon,
                              cursorColor: grey,
                              validator: (input) => !input.isNotEmpty
                                  ? "piece per cartoon should not be empty"
                                  : null,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusColor: orange,
                                hintText: "Enter piece per cartoon name",
                                hintStyle: TextStyle(
                                  color: grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          SelectClient(),
                          Container(
                            margin: EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Select Product Image",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () async {
                                        FilePickerResult picked = await getFile();
                                        if (picked != null) {
                                          File file =
                                              File(picked.files.single.path);
                                          var imagebytes = file.readAsBytesSync();
                                          image = base64Encode(imagebytes);
                                        }
                                      },
                                      child:
                                          Icon(CupertinoIcons.folder_badge_plus),
                                    )
                                  ],
                                ),
                                _file != null
                                    ? Text(_file.names.toString())
                                    : SizedBox()
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 10.0),
                            padding: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: zrepcode,
                              cursorColor: grey,
                              validator: (input) => !input.isNotEmpty
                                  ? "zrep code should not be empty"
                                  : null,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusColor: orange,
                                hintText: "Enter zrep code",
                                hintStyle: TextStyle(
                                  color: grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          SelectType(),
                          SelectCategory(),
                          Padding(
                            padding: const EdgeInsets.only(right:12.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CategoryofProducts()));

                              },
                              child: Text("Add Category?",
                                style: TextStyle(color: orange,fontSize: 14.0),),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: priceperpiece,
                              cursorColor: grey,
                              validator: (input) => !input.isNotEmpty
                                  ? "price per piece should not be empty"
                                  : null,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusColor: orange,
                                hintText: "Enter price per piece",
                                hintStyle: TextStyle(
                                  color: grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          SelectRange(),
                          Container(
                            margin: EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 10.0),
                            padding: EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: remarks,
                              cursorColor: grey,
                              validator: (input) => !input.isNotEmpty
                                  ? "remarks should not be empty"
                                  : null,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusColor: orange,
                                hintText: "Enter Remarks",
                                hintStyle: TextStyle(
                                  color: grey,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: TextButton(
                                onPressed: () async {
                                  if (validateform() == true) {
                                    setState(() {
                                      isApiCallProcess = true;
                                    });
                                    Product.sku = sku.text;
                                    Product.name = productname.text;
                                    Product.type = dropdowntype;
                                    Product.range = dropdownrange;
                                    Product.zrepcode = zrepcode.text;
                                    Product.piecepercartoon = piecepercartoon.text;
                                    Product.priceperpiece = priceperpiece.text;
                                    Product.clientid = 'Emp${dropdownclient.replaceAll(new RegExp(r'[^0-9]'), '')}';
                                    Product.brandname = BrandData.brandid[BrandData.brandname.indexOf(dropdownbrandname)];
                                    Product.category = Category.id[Category.name.indexOf(dropdowncategory)];
                                    Product.imageurl = 'data:image/jpeg;base64,/$image';

                                    await addproduct();

                                    setState(() {
                                      isApiCallProcess = false;
                                    });

                                    print(Product.sku);
                                    print(Product.name);
                                    print(Product.type);
                                    print(Product.range);
                                    print(Product.zrepcode);
                                    print(Product.piecepercartoon);
                                    print(Product.priceperpiece);
                                    print(Product.brandname);
                                    print(Product.clientid);
                                    print(Product.category);
                                    print(Product.imageurl);

                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  FieldManagerDashBoard()));
                                    }
                                  } else
                                    Flushbar(
                                      message: dropdownbrandname == null
                                          ? "select brand should not be null"
                                          : dropdownclient == null
                                              ? "select client cannot be null"
                                              : dropdowncategory == null
                                                  ? "select category should not be null"
                                                  : dropdownrange == null
                                                      ? "Select range should not be null"
                                                      : "Select type should not be null",
                                      duration: Duration(seconds: 3),
                                    )..show(context);
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(orange)),
                                child: Text(
                                  "SAVE",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  bool validateform() {
    final form = productdetails.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }


}

String dropdownbrandname;

class SelectBrandname extends StatefulWidget {
  @override
  _SelectBrandnameState createState() => _SelectBrandnameState();
}

class _SelectBrandnameState extends State<SelectBrandname> {
  List DropDownItems = BrandData.brandname.map((String val) {
  return new DropdownMenuItem<String>(
  value: val,
  child: new Text(val),
  );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      padding: EdgeInsets.only(left:10.0,right: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: DropdownButton(
        elevation: 0,
        dropdownColor: Colors.white,
        isExpanded: true,
        underline: Container(color: Colors.transparent),
        iconEnabledColor: orange,
        iconSize: 35.0,
        value: dropdownbrandname,
        onChanged: (newVal) {
          setState(() {
            dropdownbrandname = newVal;
          });
        },
        items: DropDownItems,
        hint: Text(
          "Select Brand",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

String dropdownclient;

class SelectClient extends StatefulWidget {
  @override
  _SelectClientState createState() => _SelectClientState();
}

class _SelectClientState extends State<SelectClient> {
  static List DropDownItems = employees.client.map((String val) {
    return new DropdownMenuItem<String>(
      value: val,
      child: new Text(val),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      padding: EdgeInsets.only(left:10.0,right: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: DropdownButton(
        elevation: 0,
        dropdownColor: Colors.white,
        isExpanded: true,
        underline: Container(color: Colors.transparent),
        iconEnabledColor: orange,
        iconSize: 35.0,
        value: dropdownclient,
        onChanged: (newVal) {
          setState(() {
            dropdownclient = newVal;
          });
        },
        items: DropDownItems,
        hint: Text(
          "Select Client",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

String dropdowntype;

class SelectType extends StatefulWidget {
  @override
  _SelectTypeState createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  static List DropDownItems =
      ["Regular", "Promo", "NPI", "LE-SLCI"].map((String val) {
    return new DropdownMenuItem<String>(
      value: val,
      child: new Text(val),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      padding: EdgeInsets.only(left:10.0,right: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: DropdownButton(
        elevation: 0,
        dropdownColor: Colors.white,
        isExpanded: true,
        underline: Container(color: Colors.transparent),
        iconEnabledColor: orange,
        iconSize: 35.0,
        value: dropdowntype,
        onChanged: (newVal) {
          setState(() {
            dropdowntype = newVal;
          });
        },
        items: DropDownItems,
        hint: Text(
          "Select Type",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

String dropdowncategory;

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  static List DropDownItems = Category.name.map((String val) {
    return new DropdownMenuItem<String>(
      value: val,
      child: new Text(val),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      padding: EdgeInsets.only(left:10.0,right: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: DropdownButton(
        elevation: 0,
        dropdownColor: Colors.white,
        isExpanded: true,
        underline: Container(color: Colors.transparent),
        iconEnabledColor: orange,
        iconSize: 35.0,
        value: dropdowncategory,
        onChanged: (newVal) {
          setState(() {
            dropdowncategory = newVal;
          });
        },
        items: DropDownItems,
        hint: Text(
          "Select Category",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

String dropdownrange;

class SelectRange extends StatefulWidget {
  @override
  _SelectRangeState createState() => _SelectRangeState();
}

class _SelectRangeState extends State<SelectRange> {
  static List DropDownItems = [
    "minis",
    "multipacks",
    "one_plus_one",
    "ten_twinty",
    "others"
  ].map((String val) {
    return new DropdownMenuItem<String>(
      value: val,
      child: new Text(val),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      padding: EdgeInsets.only(left:10.0,right: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: DropdownButton(
        elevation: 0,
        dropdownColor: Colors.white,
        isExpanded: true,
        underline: Container(color: Colors.transparent),
        iconEnabledColor: orange,
        iconSize: 35.0,
        value: dropdownrange,
        onChanged: (newVal) {
          setState(() {
            dropdownrange = newVal;
          });
        },
        items: DropDownItems,
        hint: Text(
          "Select Range",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
