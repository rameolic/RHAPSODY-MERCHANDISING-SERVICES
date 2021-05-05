import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Customers%20Activities.dart';
import 'CompetitonCheckTwo.dart';
import 'MenuContent.dart';
import '../../Constants.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:merchandising/model/camera.dart';
import 'package:camera/camera.dart';
import 'package:merchandising/api/customer_activites_api/Competitioncheckapi.dart';
import 'package:merchandising/api/customer_activites_api/add_competitionapi.dart';
import'package:merchandising/api/api_service.dart';



File capturedimage = File('dummy.txt');
class CompetitionCheckOne extends StatefulWidget {
  @override
  _CompetitionCheckOneState createState() => _CompetitionCheckOneState();
}

class _CompetitionCheckOneState extends State<CompetitionCheckOne> {
  GlobalKey<FormState> products = GlobalKey<FormState>();
  TextEditingController itemname = TextEditingController();
  TextEditingController promtdescp = TextEditingController();
  TextEditingController mrp = TextEditingController();
  TextEditingController sellingprice = TextEditingController();

  GlobalKey<FormState> keyone = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Text(
              'Competition Check',
              style: TextStyle(color: orange),
            ),
            Spacer(),
            SubmitButton(
              onpress: () async{
                if (validateform() == true) {
                  if (selectcompanydropdown != null &&
                      selectpromotiondropdown != null &&
                      selectbranddropdown != null) {
                    AddCompData.timesheetid = currenttimesheetid;
                    AddCompData.companyname = selectcompanydropdown;
                    AddCompData.brandname = selectbranddropdown;
                    AddCompData.itemname = itemname.text;
                    AddCompData.promotype = selectpromotiondropdown;
                    AddCompData.mrp = mrp.text;
                    AddCompData.sellingprice = sellingprice.text;

                    await addCompetition();

                    print(itemname.text);
                    print(promtdescp.text);
                    print(mrp.text);
                    print(sellingprice.text);
                    print(selectcompanydropdown);
                    print(selectpromotiondropdown);
                    print(selectbranddropdown);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CustomerActivities()));
                  }
                  else Flushbar(
                      message: selectcompanydropdown==null?"select company should not be null"
                          :selectpromotiondropdown==null?"select promotion should not be null":"select Brand name should not be null "
                  )..show(context);
                }
              },
            ),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutletDetails(),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: Form(
                    key: keyone,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 30,
                          width: 120,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                          ),
                          child: Center(
                              child: Text(
                                "Competitor Info",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.00),
                          decoration: BoxDecoration(
                              color: pink, borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left:10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: DropdownSelectCompany(),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  padding: EdgeInsets.only(left:10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: DropdownSelectBrand()),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                padding: EdgeInsets.only(left:10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: TextFormField(
                                  controller: itemname,
                                  cursorColor: grey,
                                  validator: (input) =>
                                  !input.isNotEmpty ? "Item should not be empty" : null,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusColor: orange,
                                    hintText: "Item Name",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  padding: EdgeInsets.only(left:10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: DropdownSelectPromotion()),
                              promodescptn != null ? Container(
                                margin: EdgeInsets.only(top: 10.0),
                                padding: EdgeInsets.only(left:10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(promodescptn),
                              ):SizedBox(),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                padding: EdgeInsets.only(left:10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: TextFormField(
                                  controller: mrp,
                                  cursorColor: grey,
                                  validator: (input) =>
                                  !input.isNotEmpty ? "MRP should not be empty" : null,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusColor: orange,
                                    hintText: "Enter MRP Here",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                padding: EdgeInsets.only(left:10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: TextFormField(
                                  controller: sellingprice,
                                  cursorColor: grey,
                                  validator: (input) => !input.isNotEmpty
                                      ? "Selling Price should not be empty"
                                      : null,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusColor: orange,
                                    hintText: "Enter Selling Price Here",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:10.0),
                                child: Row(
                                  children: [
                                    Text("Capture Image"),
                                    Spacer(),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child:
                                      // ignore: unrelated_type_equality_checks
                                      capturedimage.toString() !=
                                          'File: \'dummy.txt\''
                                          ? GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                      PreveiwScreen(
                                                        input: capturedimage,
                                                      )));
                                        },
                                        child: Image(
                                          height: 50,
                                          width: 50,
                                          image: FileImage(capturedimage),
                                        ),
                                      )
                                          : Image(
                                        width: 50,
                                        image: AssetImage('images/capture.png'),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          CupertinoIcons.photo_camera_solid,
                                          color: Colors.grey[700],
                                        ),
                                        onPressed: () {
                                          _showSelectionDialog(context);
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  bool validateform() {
    final form = keyone.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}


class PreveiwScreen extends StatelessWidget {
  PreveiwScreen({@required this.input});
  File input;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: [
          GestureDetector(
            onVerticalDragEnd: (details) {
              Navigator.pop(context);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: PhotoView(
                  loadingBuilder: (context, event) => Center(
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  imageProvider: FileImage(input)),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FloatingActionButton(
                  backgroundColor: pink,
                  child: Icon(Icons.check,size: 35,color: orange),
                  onPressed:(){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => CompetitionCheckOne()));
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}
Future<void> _showSelectionDialog(BuildContext context) {
  FilePickerResult _file;
  Future getFile() async {
    FilePickerResult file = await FilePicker.platform.pickFiles();
    _file = file;
    return _file;
  }

  return showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Container(
          height: 180,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
              padding: EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "From where do you want to take the photo?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Selectedscreen ="competitioncheck";
                      WidgetsFlutterBinding.ensureInitialized();

                      // Obtain a list of the available cameras on the device.
                      final cameras = await availableCameras();

                      // Get a specific camera from the list of available cameras.
                      final firstCamera = cameras.first;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TakePictureScreen(
                                  )));
                    },
                    child: Container(
                      color: Colors.white,
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.camera_fill,
                            size: 40,
                            color: orange,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Camera",
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      FilePickerResult picked = await getFile();
                      if (picked != null) {
                        File file = File(picked.files.single.path);
                        capturedimage = file;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CompetitionCheckOne()));
                      }
                    },
                    child: Container(
                      color: Colors.white,
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.doc_circle_fill,
                            size: 40,
                            color: orange,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("File Explorer"),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Note* If you select File Explorer you have to select the images that contain watermark of date and time ",
                    style: TextStyle(
                      fontSize: 12,
                      color: orange,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        );
      });
}




class DropdownSelectCompany extends StatefulWidget {
  @override
  _DropdownSelectCompanyState createState() => _DropdownSelectCompanyState();
}

String selectcompanydropdown;
var promodescptn;

class _DropdownSelectCompanyState extends State<DropdownSelectCompany> {
  static List DropDownItems =  competitiondata.company.toSet().toList().map((String val) {
    return new DropdownMenuItem<String>(
      value: val,
      child: new Text(val),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: DropdownButton(
        underline: SizedBox(),
        elevation: 0,
        dropdownColor: Colors.white,
        isExpanded: true,
        iconEnabledColor: orange,
        iconSize: 35.0,
        value: selectcompanydropdown,
        onChanged: (newVal) {
          setState(() {
            selectcompanydropdown = newVal;
          });
        },
        items: DropDownItems,
        hint: Text(
          "Select Company",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class DropdownSelectBrand extends StatefulWidget {
  @override
  _DropdownSelectBrandState createState() => _DropdownSelectBrandState();
}

String selectbranddropdown;

class _DropdownSelectBrandState extends State<DropdownSelectBrand> {
  int dropDownValue = 0;
  static List DropDownItems =
  competitiondata.brand.toSet().toList().map((String val) {
    return new DropdownMenuItem<String>(
      value: val,
      child: new Text(val),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: DropdownButton(
        underline: SizedBox(),
        elevation: 0,
        dropdownColor: Colors.white,
        isExpanded: true,
        iconEnabledColor: orange,
        iconSize: 35.0,
        value: selectbranddropdown,
        onChanged: (newVal) {
          setState(() {
            selectbranddropdown = newVal;
          });
        },
        items: DropDownItems,
        hint: Text(
          "Select category",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class DropdownSelectPromotion extends StatefulWidget {
  @override
  _DropdownSelectPromotionState createState() =>
      _DropdownSelectPromotionState();
}

String selectpromotiondropdown;

class _DropdownSelectPromotionState extends State<DropdownSelectPromotion> {
  static List DropDownItems =  competitiondata.promotion.toSet().toList().map((String val) {
    return new DropdownMenuItem<String>(
      value: val,
      child: new Text(val),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: DropdownButton(
        underline: SizedBox(),
        elevation: 0,
        dropdownColor: Colors.white,
        isExpanded: true,
        iconEnabledColor: orange,
        iconSize: 35.0,
        value: selectpromotiondropdown,
        onChanged: (newVal) {
          setState(() {
            selectpromotiondropdown = newVal;
          });
        },
        items: DropDownItems,
        hint: Text(
          "Select Promotion Type",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  SubmitButton({@required this.onpress});
  final onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
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

