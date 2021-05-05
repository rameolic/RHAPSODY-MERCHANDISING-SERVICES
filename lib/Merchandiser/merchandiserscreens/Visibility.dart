import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import '../../Constants.dart';
import 'Customers Activities.dart';
import 'package:merchandising/api/api_service.dart';
import 'MenuContent.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:merchandising/model/camera.dart';
import 'package:camera/camera.dart';
import 'package:photo_view/photo_view.dart';
import 'package:merchandising/api/customer_activites_api/visibilityapi.dart';
import 'package:merchandising/api/customer_activites_api/add_visibilityapi.dart';
class selected {
  static int index;
}
List<int>checkvaluevisibility =[];
List<String> listitems = VisibilityData.productname;
List<File> images = [];

class VisibilityOne extends StatefulWidget {
  @override
  _VisibilityOneState createState() => _VisibilityOneState();
}

class _VisibilityOneState extends State<VisibilityOne> {
  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";
  List<String> _filterList;
  @override
  void initState() {
    super.initState();
    listitems.sort();
  }

  _VisibilityOneState() {
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
    appBar: new AppBar(
      backgroundColor: containerscolor,
      iconTheme: IconThemeData(color: orange),
      title: Row(
        children: [
          new Text(
            "Visibility",
            style: TextStyle(color: orange),
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
        Column(
          children: [
            OutletDetails(),
            Expanded(
              child: Container(
                child: new Column(
                  children: <Widget>[
                    _createSearchView(),
                    _firstSearch ? _createListView() : _performSearch()
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
      ),
    );
  }

  Widget _createSearchView() {
    return new Container(
      margin: EdgeInsets.fromLTRB(10.0, 0, 10, 0),
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: new TextField(
              style: TextStyle(color: orange),
              controller: _searchview,
              cursorColor: orange,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                focusColor: orange,
                hintText: 'Search by Product Name',
                hintStyle: TextStyle(color: orange),
                border: InputBorder.none,
                icon: Icon(
                  CupertinoIcons.search,
                  color: orange,
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                _searchview.clear();
              },
              child: Icon(
                CupertinoIcons.clear_circled_solid,
                color: orange,
              ))
        ],
      ),
    );
  }

  Widget _createListView() {
    print(images.length);
    return new Flexible(
      child: new ListView.builder(
          shrinkWrap: true,
          itemCount: listitems.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              padding: EdgeInsets.all(10.00),
              margin: EdgeInsets.only(top: 10, right: 10, left: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: pink, borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return VeiwImage(
                              url: VisibilityData.imageurl[index],
                            );
                          },
                        ),);
            },
                    child: Container(
                      height: 120,
                      width: 80,
                      child: PhotoView(
                        loadingBuilder: (context, event) => Center(
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              backgroundColor: orange,
                            ),
                          ),
                        ),
                        enableRotation: true,
                        imageProvider: NetworkImage(VisibilityData.imageurl[index]),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1.7,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: new Text(
                            "${listitems[index]}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      VisibilitySwitchOne(
                        indexrunning: index,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.photo_camera_solid,
                      size: 30,
                    ),
                    onPressed: () {
                      Selectedscreen ="visibility";
                      selected.index = index;
                      _showSelectionDialog(context);
                      /*Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) => OpenCamera()));*/
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _performSearch() {
    _filterList = [];
    for (int i = 0; i < listitems.length; i++) {
      var item = listitems[i];

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    return _createFilteredListView();
  }

  Widget _createFilteredListView() {
    return new Flexible(
      child: new ListView.builder(
          shrinkWrap: true,
          itemCount: _filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
              padding: EdgeInsets.all(10.00),
              margin: EdgeInsets.only(top: 10, right: 10, left: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: pink, borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return VeiwImage(
                              url: VisibilityData.imageurl[index],
                            );
                          },
                        ),);
                    },
                    child: Container(
                      height: 120,
                      width: 80,
                      child: PhotoView(
                        loadingBuilder: (context, event) => Center(
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              backgroundColor: orange,
                            ),
                          ),
                        ),
                        enableRotation: true,
                        imageProvider: NetworkImage(VisibilityData.imageurl[index]),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      new Text(
                        "${_filterList[index]}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      VisibilitySwitchOne(
                        indexrunning: index,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.photo_camera_solid,
                      size: 30,
                    ),
                    onPressed: () {
                      Selectedscreen ="visibility";
                      selected.index = index;
                      _showSelectionDialog(context);
                      /*Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) => OpenCamera()));*/
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class VisibilitySwitchOne extends StatefulWidget {
  final int indexrunning;

  VisibilitySwitchOne({@required this.indexrunning});
  @override
  _VisibilitySwitchOneState createState() => _VisibilitySwitchOneState();
}

class _VisibilitySwitchOneState extends State<VisibilitySwitchOne> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 80,
            child: Column(
              children: [
                Text(
                  "Is Available",
                  style: TextStyle(fontSize: 15),
                ),
                Switch(
                  value: checkvaluevisibility[widget.indexrunning]==0?true:false,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      isSwitched == true ? checkvaluevisibility[widget.indexrunning] = 0  : checkvaluevisibility[widget.indexrunning]=1;
                      images[widget.indexrunning] =File('dummy.txt');
                      print(checkvaluevisibility);
                    });
                  },
                  inactiveTrackColor: orange,
                  activeColor: Colors.red,
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            height: 88,
            child: Column(
              children: [
                Text(
                  checkvaluevisibility[widget.indexrunning]==0 ? "Reason" : "Capture Image",
                  style: TextStyle(fontSize: 15),
                ),
                checkvaluevisibility[widget.indexrunning]==0
                    ? ReasonDropdown(
                  item: widget.indexrunning,
                )
                    : Container(
                        margin: EdgeInsets.all(10),
                        child:
                            // ignore: unrelated_type_equality_checks
                            images[widget.indexrunning].toString() !=
                                    'File: \'dummy.txt\''
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  PreveiwScreen(
                                                    input: widget.indexrunning,
                                                  )));
                                    },
                                    child: Image(
                                      height: 50,
                                      width: 50,
                                      image: FileImage(
                                          images[widget.indexrunning]),
                                    ),
                                  )
                                : Image(
                                    width: 50,
                                    image: AssetImage('images/capture.png'),
                                  ),
                      ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
List<String>visibilityreasons=[];
class ReasonDropdown extends StatefulWidget {
  ReasonDropdown({this.item});
  final item;
  @override
  _ReasonDropdownState createState() => _ReasonDropdownState();
}

List listofreasons =  ["Item Expired","Pending Delivery","Out Of Stock"].map((String val) {return new DropdownMenuItem<String>(value: val, child: new Text(val),);}).toList();
var selectedreason;

class _ReasonDropdownState extends State<ReasonDropdown> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: SizedBox(
        height: 50,
        width: 100,
        child: DropdownButton(
          elevation: 0,
          underline: SizedBox(),
          dropdownColor: Colors.white,
          isExpanded: true,
          iconEnabledColor: orange,
          iconSize: 35.0,
          value: selectedreason,
          onChanged: (newVal){
            setState(() {
              selectedreason = newVal;
              visibilityreasons[widget.item]=newVal;
              print(visibilityreasons);
            });
            },
          items: listofreasons,
          hint: Text("Select Reason",style: TextStyle(color: Colors.black,fontSize: 14),),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // for(int i=0;i<VisibilityData.productname.length;i++){
        //   AddVisiData.brandname.add('\"${VisibilityData.brandname[i]}\"');
        //   AddVisiData.categoryname.add('\"${VisibilityData.categoryname[i]}\"');
        //   AddVisiData.productname.add('\"${VisibilityData.productname[i]}\"');
        // }
        AddVisiData.brandname = VisibilityData.brandname;
        AddVisiData.categoryname=VisibilityData.categoryname;
        AddVisiData.productname = VisibilityData.productname;
        AddVisiData.outletid = outletrequestdata.outletidpressed;
        AddVisiData.timesheetid = checkinoutdata.checkid;
        AddVisiData.productid = VisibilityData.productid;
        AddVisiData.brandid = VisibilityData.brandid;
        AddVisiData.brandname = VisibilityData.brandname;
        AddVisiData.categoryname = VisibilityData.categoryname;
        AddVisiData.productname =VisibilityData.productname;
        AddVisiData.reason = visibilityreasons;
        AddVisiData.outletpdtmap = VisibilityData.mappingid;
        AddVisiData.checkvalue = checkvaluevisibility;
        await addVisibilitydata();
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
                        images[selected.index] = file;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    VisibilityOne()));
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

class PreveiwScreen extends StatelessWidget {
  PreveiwScreen({@required this.input});
  int input;
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
                          child: CircularProgressIndicator(
                            backgroundColor: orange,
                          ),
                        ),
                      ),
                  imageProvider: FileImage(images[input])),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => VisibilityOne()));
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}


class VeiwImage extends StatelessWidget {
  VeiwImage({this.url});
  var url;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhotoView(
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 40.0,
              height: 40.0,
              child: CircularProgressIndicator(
              ),
            ),
          ),
          imageProvider: NetworkImage(
            url,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left :15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              VisibilityOne()));
                },
                backgroundColor: Colors.black,
                child: Icon(Icons.arrow_back,color: orange,),
              ),
            ),
          ),
        )
      ],
    );
  }
}