import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'addoutlets.dart';
import 'package:merchandising/api/FMapi/outletapi.dart';


class Oulets extends StatefulWidget {
  @override
  _OuletsState createState() => _OuletsState();
}

class _OuletsState extends State<Oulets> {
  var _searchview = new TextEditingController();
  bool _firstSearch = true;
  String _query = "";

  List<String> _filterList;
  List<String> _filterArea;
  List<String> _filterLat;
  List<String> _filterLong;
  List<String> _filterContactnum;
  List<String> _filterLocation;

  _OuletsState() {
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
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pink,
          iconTheme: IconThemeData(color: orange),
          title: Text("Outlet Details",style: TextStyle(color: orange),),
        ),
        // drawer: Drawer(
        //   child: Menu(),
        // ),
        body: Stack(
          children: [
            BackGround(),
            Container(
              margin: EdgeInsets.fromLTRB(10.0,10,10,0),
              child: new Column(
                children: <Widget>[
                  _createSearchView(),
                  SizedBox(height: 10.0,),
                  _firstSearch ? _createListView() : _performSearch(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext
                            context) =>
                                AddOutlets()));
                  },
                  backgroundColor: pink,
                  elevation: 8.0,
                  child: Icon(Icons.add,color: orange,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _createSearchView() {
    return new Container(
      padding: EdgeInsets.only(left: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(color: pink,
          borderRadius: BorderRadius.circular(100.0)),
      child: new TextField(
        style: TextStyle(color: orange),
        controller: _searchview,
        cursorColor:orange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          focusColor: orange,
          hintText: 'Search by Storename/Code',
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
      child: new ListView.builder(
          shrinkWrap: true,
          itemCount: outletdata.outletname.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(bottom:5.0,top: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${outletdata.outletname[index]}',
                        style: TextStyle(
                            fontSize: 14.0,fontWeight: FontWeight.bold
                        )),
                    SizedBox(height: 5),
                    Text('${outletdata.address[index]}'),
                    SizedBox(height: 5),
                    Text('Latitude : ${outletdata.outletlat[index].toString()}'),
                    SizedBox(height: 5),
                    Text('Longitude : ${outletdata.outletlong[index].toString()}'),
                    SizedBox(height: 5),
                    Text('Contact Number : ${outletdata.contactnumber[index].toString()}'),
                    SizedBox(height: 5),
                    Text('Location : ${outletdata.outletarea[index]},${outletdata.outletcity[index]},${outletdata.outletstate[index]},${outletdata.outletcountry[index]}',
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                  ],
                ));
          }),
    );
  }

  Widget _performSearch() {
    _filterList = [];
    _filterArea = [];
    _filterLat = [];
    _filterLong =[];
    _filterContactnum =[];
    _filterLocation =[];
    for (int i = 0; i <outletdata.outletname.length; i++) {
      var item = outletdata.outletname[i];
      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
        int index = outletdata.outletname.indexOf(item);
        _filterArea.add(outletdata.address[index]);
        _filterLat.add(outletdata.outletlat[index]);
        _filterLong.add(outletdata.outletlong[index]);
        _filterContactnum.add(outletdata.contactnumber[index].toString());
        _filterLocation.add('${outletdata.outletarea[index]},${outletdata.outletcity[index]},${outletdata.outletstate[index]},${outletdata.outletcountry[index]}',);

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
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(bottom:5.0,top: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${_filterList[index]}',
                        style: TextStyle(
                            fontSize: 14.0,fontWeight: FontWeight.bold
                        )),
                    SizedBox(height: 5),
                    Text('${_filterArea[index]}'),
                    SizedBox(height: 5),
                    Text('Latitude : ${_filterLat[index].toString()}'),
                    SizedBox(height: 5),
                    Text('Longitude : ${_filterLong[index].toString()}'),
                    SizedBox(height: 5),
                    Text('Contact Number : ${_filterContactnum[index].toString()}'),
                    SizedBox(height: 5),
                    Text('Location : ${_filterLocation[index]}',
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                  ],
                ));
          }),
    );
  }
}
