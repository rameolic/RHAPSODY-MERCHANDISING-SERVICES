import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'MenuContent.dart';
import 'Customers Activities.dart';
import 'package:auto_size_text/auto_size_text.dart';

List<String> categories = ['Chocolate', 'Petfood', 'Icecream'];
List<String> Brands = ['mars', 'cadbury', 'ArunIceCreams', 'pedigree'];
String Selectedcategory;
String Selectedbrand;
List<String> defaulflist = ['dairymilk', 'snikers', 'silk','pedigree','dry dog food','dry kibble','strawberry','vanilla','butterscoth'];
List<String> filteredList = [];
class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  //List<bool> isSelected;
  var _searchview = new TextEditingController();
  bool _firstSearch = true;
  String _query = "";
  List<String> _filterList;
  List<String> InputList = defaulflist;
  @override
  _AvailabilityState() {

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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: containerscolor,
            iconTheme: IconThemeData(color: orange),
            title: Row(
              children: [
                Text(
                  'Availability',
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
                  OutletDetails(),
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            width: MediaQuery.of(context).size.width/2.15,
                            child: DropdownButton<String>(
                                underline: SizedBox(),
                                isExpanded: true,
                                iconEnabledColor: orange,
                                elevation: 20,
                                dropdownColor: Colors.white,
                                items: categories.map((String val) {
                                  return new DropdownMenuItem<String>(
                                    value: val,
                                    child: new Text(val),
                                  );
                                }).toList(),
                                hint: Text("Category"),
                                value: Selectedcategory,
                                onChanged: (newVal) {
                                  setState(() {
                                    Selectedcategory = newVal;
                                  });
                                })),
                        Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            width: MediaQuery.of(context).size.width/2.15,
                            child: DropdownButton<String>(
                                underline: SizedBox(),
                                isExpanded: true,
                                iconEnabledColor: orange,
                                elevation: 20,
                                dropdownColor: Colors.white,
                                items: Brands.map((String val) {
                                  return new DropdownMenuItem<String>(
                                    value: val,
                                    child: new Text(val),
                                  );
                                }).toList(),
                                hint: Text("Brand"),
                                value: Selectedbrand,
                                onChanged: (newVal) {
                                  setState(() {
                                    Selectedbrand = newVal;
                                  });
                                })),
                      ],
                    ),
                  ),
                  _createSearchView(),
                  _firstSearch
                      ? _createListView()
                      : _performSearch(),
                ],
              ),
            ],
          )),
    );
  }
  Widget _createSearchView() {
    return new Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.only(left: 20.0,right: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: new TextField(
              style: TextStyle(color: orange),
              controller: _searchview,
              cursorColor:orange,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                focusColor: orange,
                hintText: 'Search by Product Name',
                hintStyle: TextStyle(color: orange),
                border: InputBorder.none,
                icon: Icon(CupertinoIcons.search,color: orange,),
              ),
            ),
          ),
          GestureDetector(
              onTap: (){
                _searchview.clear();
              },
              child: Icon(CupertinoIcons.clear_circled_solid,color: orange,))
        ],
      ),
    );
  }
  Widget _createListView() {
    return new Flexible(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 10, right: 10),
              decoration: BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
              ),
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: Text(
                      "Item/Description",
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:20.0),
                    child: Text(
                      " Avl",
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
              decoration: BoxDecoration(
                color: pink,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
              ),
              child: new ListView.builder(
                shrinkWrap: true,
                  itemCount: InputList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width/1.25,
                            decoration: index != InputList.length-1 ? BoxDecoration(

                              border: Border(
                                right: BorderSide( //                   <--- left side
                                  color: Colors.black,
                                ),
                                bottom:BorderSide( //                   <--- left side
                                  color: Colors.black,
                                ),
                              )
                            ):BoxDecoration(
                              border: Border(
                                right: BorderSide( //                   <--- left side
                                  color: Colors.black,
                                ),)
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${InputList[index]}',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                          Container(
                            height: 50, //width: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/1.25)),
                              decoration:index != InputList.length-1 ? BoxDecoration(
                                border: Border(
                                  bottom:BorderSide( //                   <--- left side
                                    color: Colors.black,
                                  ),
                                ),):BoxDecoration(
                              ),
                              child: ToggleSwitch(
                                item: InputList[index],
                              ))
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _performSearch() {
    _filterList = [];
    for (int i = 0; i <InputList.length; i++) {
      var item = InputList[i];
      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    return _createFilteredListView();
  }

  Widget _createFilteredListView() {
    return new Flexible(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 10, right: 10),
              decoration: BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
              ),
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: Text(
                      "Item/Description",
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:20.0),
                    child: Text(
                      " Avl",
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
              decoration: BoxDecoration(
                color: pink,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
              ),
              child: new ListView.builder(
                 shrinkWrap: true,
                  itemCount: _filterList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width/1.25,
                            decoration: index != _filterList.length-1 ? BoxDecoration(

                                border: Border(
                                  right: BorderSide( //                   <--- left side
                                    color: Colors.black,
                                  ),
                                  bottom:BorderSide( //                   <--- left side
                                    color: Colors.black,
                                  ),
                                )
                            ):BoxDecoration(
                                border: Border(
                                  right: BorderSide( //                   <--- left side
                                    color: Colors.black,
                                  ),)
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${_filterList[index]}',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                          Container(
                              height: 50, //width: (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/1.25)),
                              decoration:index != _filterList.length-1 ? BoxDecoration(
                                border: Border(
                                  bottom:BorderSide( //                   <--- left side
                                    color: Colors.black,
                                  ),
                                ),):BoxDecoration(
                              ),
                              child: ToggleSwitch(
                                item: _filterList[index],
                              ))
                        ],
                      ),
                    );
                  }),
            ),
          ],
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

List<String> outofStockitems = [];

class ToggleSwitch extends StatefulWidget {
  ToggleSwitch({this.item});
   final item;
  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {

   bool isSwitched = false;
  @override
   Void initState() {
    super.initState();
    bool value = outofStockitems.contains(widget.item) == true ? true : false;
    setState(() {
      isSwitched = value;
    });
  }
 // bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
          isSwitched == true ? outofStockitems.add( widget.item) : outofStockitems.remove( widget.item);
          print(outofStockitems);
        });
      },
      inactiveTrackColor: Colors.green,
      activeColor: Colors.red,
    );
  }
}

