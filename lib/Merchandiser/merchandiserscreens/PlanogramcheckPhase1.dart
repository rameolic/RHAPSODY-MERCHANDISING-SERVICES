import 'package:flutter/material.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/customer_activites_api/add_planogramapi.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'package:merchandising/model/camera.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Customers Activities.dart';
import 'package:merchandising/api/customer_activites_api/planogramdetailsapi.dart';
import 'package:merchandising/api/customer_activites_api/addplanogram.dart';
//String url = "https://rms2.rhapsody.ae/planogram_images/${PlanoDetails.imageurl.toString()}";
String url = "https://rms2.rhapsody.ae/planogram_image/1619431232.tang_planogram.png";


String ontap;
int selectedindex;
List<File> afterimages = [];
List<File> beforeimages = [];

List<String> afterimagesencode = [];
List<String> beforeimagesencode = [];
class PlanogramCheckPhase1 extends StatefulWidget {
  @override
  _PlanogramCheckPhase1State createState() => _PlanogramCheckPhase1State();
}

class _PlanogramCheckPhase1State extends State<PlanogramCheckPhase1> {
  List<String> planolist =PlanoDetails.categoryname;

  var _searchview = new TextEditingController();
  bool _firstSearch = true;
  String _query = "";
  List<String> productdata;
  List<String> _filterList;

  @override
  void initState() {
    super.initState();
    productdata = planolist;
    productdata.sort();
  }

  _PlanogramCheckPhase1State() {

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Text(
              'Planogram Check',
              style: TextStyle(color: orange),
            ),
            Spacer(),
            SubmitButton(
              onpress: ()async{
                AddPlanoData.beforeimage = beforeimagesencode;
                AddPlanoData.afterimage = afterimagesencode;
                AddPlanoData.outletid = currentoutletid;
                AddPlanoData.timesheetid = currenttimesheetid;
                AddPlanoData.outletpdtmapid = PlanoDetails.opm;
                AddPlanoData.categoryname = PlanoDetails.categoryname;
                AddPlanoData.planoimage = PlanoDetails.imageurl;
               AddPlanoData.categoryid = PlanoDetails.categoryid;


                //PlanoDetails.beforeimage = beforeimagesencode;
                //PlanoDetails.afterimage = afterimagesencode;

                print('Category Name: ${AddPlanoData.categoryname}');
                print('OPM id: ${AddPlanoData.outletpdtmapid}');


                await addPlanogramdata();



                {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                        CustomerActivities()));}
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
          Column(
            children: [
              OutletDetails(),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10.0,0,10,0),
                  child: new Column(
                    children: <Widget>[
                      _createSearchView(),
                      SizedBox(height: 10.0,),
                      _firstSearch ? _createListView() : _performSearch(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _createSearchView() {
    return new Container(
      padding: EdgeInsets.only(left: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(color: pink,
          borderRadius: BorderRadius.circular(25.0)),
      child: new TextField(
        style: TextStyle(color: orange),
        controller: _searchview,
        cursorColor:orange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          focusColor: orange,
          hintText: 'Search by Category name',
          hintStyle: TextStyle(color: orange),
          border: InputBorder.none,
          icon: Icon(CupertinoIcons.search,color: orange,),
          isCollapsed: true,
        ),
      ),
    );
  }
  Widget _createListView() {
    return new Flexible(
      child: new  ListView.builder(
          shrinkWrap: true,
          itemCount: PlanoDetails.categoryname.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(color: pink,borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height/4,
              margin: EdgeInsets.only(top:5),
              padding: EdgeInsets.fromLTRB(10.0,10,10,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category Name : ${PlanoDetails.categoryname[index]}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Table(
                    columnWidths: {
                      0: FractionColumnWidth(.34),
                      1: FractionColumnWidth(.33),
                      2: FractionColumnWidth(.33),

                    },
                    children: [
                      TableRow(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 15.0,),
                              Text("Target",style: TextStyle(fontWeight: FontWeight.bold),),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              VeiwImage(
                                                url: PlanoDetails.imageurl[index],
                                              )));
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0,14.0,0.0,0.0),
                                  height: 100,
                                  width: 100,
                                  child: PhotoView(
                                    loadingBuilder: (context, event) => Center(
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        child: CircularProgressIndicator(
                                          backgroundColor:orange
                                        ),
                                      ),
                                    ),
                                    imageProvider: NetworkImage(
                                      PlanoDetails.imageurl[index],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 10.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Selectedscreen = "planogram";
                                      ontap = 'before';
                                      selectedindex = index;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  TakePictureScreen(
                                                  )));
                                    },
                                    child:Icon(CupertinoIcons.photo_camera_solid,) ,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text("Before",style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                              Container(
                                margin:EdgeInsets.only(top:10),
                                // ignore: unrelated_type_equality_checks
                                child: beforeimages[index].toString() !=
                                    'File: \'dummy.txt\''
                                    ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PreveiwScreen(
                                                  input: beforeimages[index],
                                                )));
                                  },
                                  child: Image(
                                    height: 100,
                                    image: FileImage(beforeimages[index]),
                                  ),
                                )
                                    : Image(
                                  height: 100,
                                  image: AssetImage('images/capture.png'),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 10.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Selectedscreen = "planogram";
                                      ontap = 'after';
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  TakePictureScreen(
                                                  )));
                                    },
                                    child:Icon(CupertinoIcons.photo_camera_solid,) ,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text("After",style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                              Container(
                                margin:EdgeInsets.only(top:10),
                                // ignore: unrelated_type_equality_checks
                                child: afterimages[index].toString() !=
                                    'File: \'dummy.txt\''
                                    ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PreveiwScreen(
                                                  input: afterimages[index],
                                                )));
                                  },
                                  child: Image(
                                    height: 100,
                                    image: FileImage(afterimages[index]),
                                  ),
                                )
                                    : Image(
                                  width:100,

                                  image: AssetImage('images/capture.png'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _performSearch() {
    _filterList = [];

    for (int i = 0; i <PlanoDetails.categoryname.length; i++) {
      var item = PlanoDetails.categoryname[i];
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
            return Container(
              decoration: BoxDecoration(color: pink,borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height/4,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${_filterList[index]}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Table(
                    columnWidths: {
                      0: FractionColumnWidth(.3),
                      1: FractionColumnWidth(.35),
                      2: FractionColumnWidth(.35),

                    },
                    children: [

                      TableRow(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(10.0,60.0,10.0,10.0),
                                height: 80,
                                child: PhotoView(
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
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(icon:Icon(CupertinoIcons.photo_camera_solid,), onPressed: (){
                                    ontap = 'before';
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                TakePictureScreen(
                                                )));
                                  }),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text("Before",style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),



                              Container(

                                margin:EdgeInsets.only(top:10),
                                // ignore: unrelated_type_equality_checks
                                child: beforeimages[index].toString() !=
                                    'File: \'dummy.txt\''
                                    ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PreveiwScreen(
                                                  input: beforeimages[index],
                                                )));
                                  },
                                  child: SizedBox(
                                    width: 80,

                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image(
                                        image: FileImage(beforeimages[index]),
                                      ),
                                    ),
                                  ),
                                )
                                    : Image(
                                  width: 80,
                                  image: AssetImage('images/capture.png'),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(icon:Icon(CupertinoIcons.photo_camera_solid,), onPressed: (){
                                    ontap = 'after';
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                TakePictureScreen(
                                                )));
                                  }),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text("After",style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),



                              Container(

                                margin:EdgeInsets.only(top:10),
                                // ignore: unrelated_type_equality_checks
                                child: beforeimages[index].toString() !=
                                    'File: \'dummy.txt\''
                                    ? GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PreveiwScreen(
                                                  input: afterimages[index],
                                                )));
                                  },
                                  child: SizedBox(
                                    width: 80,

                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: Image(
                                        image: FileImage(afterimages[index]),
                                      ),
                                    ),
                                  ),
                                )
                                    : Image(
                                  width: 80,
                                  image: AssetImage('images/capture.png'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),



                    ],
                  ),
                ],
              ),
            );
          }),
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
        margin:EdgeInsets.only(right:10.00),
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PlanogramCheckPhase1()));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PlanogramCheckPhase1()));
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}
