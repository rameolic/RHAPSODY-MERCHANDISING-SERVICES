import 'package:merchandising/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/MenuContent.dart';
import 'editbrands_to_outlets.dart';
import 'package:merchandising/api/FMapi/outlet brand mappingapi.dart';
import 'products.dart';
import 'package:photo_view/photo_view.dart';

var Selectedoutlet;
 var Selectedoutletaddress;
 var Selectedoutletcontactnumber;
// List<String> Selectedbrandname;
// List<String> Selectedplanogram;
// List<String> Selectedshelf;
// List<String> Selectedtarget;

class OutletsmapedtoBrands extends StatefulWidget {
  @override
  _OutletsmapedtoBrandsState createState() => _OutletsmapedtoBrandsState();
}

class _OutletsmapedtoBrandsState extends State<OutletsmapedtoBrands> {
  var _searchview = new TextEditingController();
  bool _firstSearch = true;
  String _query = "";

  List<String> _filterList;
  List<String>_filteraddress;
  List<String>_filtercontact;

  _OutletsmapedtoBrandsState() {
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
          title: Text("outlets Brands mapping",style: TextStyle(color: orange),),
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
                                EditBrandstoOutlet()));
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
          borderRadius: BorderRadius.circular(25.0)),
      child: new TextField(
        style: TextStyle(color: orange),
        controller: _searchview,
        cursorColor:orange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          focusColor: orange,
          hintText: 'Search by outlet Name/Code',
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
          itemCount:InputListoutletname.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Selectedoutlet = InputListoutletname[index];
                Selectedoutletaddress = distantlistaddress[index];
                Selectedoutletcontactnumber = distantlistcontact[index];
                print(Selectedoutlet);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MappedOutlets()));
              },
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.only(bottom:5.0,top: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${InputListoutletname[index]}',
                          style: TextStyle(
                              fontSize: 15.0,fontWeight: FontWeight.bold
                          )),
                      SizedBox(height: 5),
                      Text("address : ${distantlistaddress[index]}",
                          style: TextStyle(
                            fontSize: 14.0,
                          )),
                      SizedBox(height: 5),
                      Text('Contact : ${distantlistcontact[index]}',
                          style: TextStyle(
                            fontSize: 14.0,
                          )),

                    ],
                  )),
            );
          }),
    );
  }

  Widget _performSearch() {
    _filterList = [];
    _filteraddress = [];
    _filtercontact = [];
    for (int i = 0; i <InputListoutletname.length; i++) {
      var item = InputListoutletname[i];
      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
        int index = InputListoutletname.indexOf(item);
        _filteraddress.add(distantlistaddress[index]);
        _filtercontact.add(distantlistcontact[index]);
      }
    }
    return _createFilteredListView();
  }

  Widget _createFilteredListView() {
    return new Flexible(
      child: new ListView.builder(
          shrinkWrap: true,
          itemCount:  _filterList.length,
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
                    Text('${ _filterList[index]}',
                        style: TextStyle(
                            fontSize: 15.0,fontWeight: FontWeight.bold
                        )),
                    SizedBox(height: 5),
                    Text("address  : ${_filteraddress[index]}",
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                    SizedBox(height: 5),
                    Text('contact : ${_filtercontact[index]}',
                        style: TextStyle(
                          fontSize: 14.0,
                        )),
                  ],
                ));
          }),
    );
  }
}

class MappedOutlets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        iconTheme: IconThemeData(color: orange),
        title: Text("Mapped outlets",style: TextStyle(color: orange),),
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
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(5.00),
              decoration: BoxDecoration(
                  color: pink,
                  borderRadius: BorderRadiusDirectional.circular(10)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10.0),
                    Icon(
                      Icons.house_sharp,
                      color: iconscolor,size: 40,
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Selectedoutlet,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        Padding(
                          padding: const EdgeInsets.only(left:5.0),
                          child: Text(Selectedoutletaddress),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0),
                  ],
                ),
              ),
        ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount:mapping.outletname.length,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      Selectedoutlet == mapping.outletname[index] ? Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.only(left:10.0,bottom: 10.0,right: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Brand Name : ${mapping.brandname[index]}',
                                style: TextStyle(
                                    fontSize: 15.0,fontWeight: FontWeight.bold
                                )),
                            SizedBox(height: 5),
                            Text("Total Shelf Size : ${mapping.shelf[index]} meters",
                                style: TextStyle(
                                  fontSize: 14.0,
                                )),
                            SizedBox(height: 5),
                            Text('Target : ${mapping.target[index]}%',
                                style: TextStyle(
                                  fontSize: 14.0,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Planogram Image : "),
                                GestureDetector(
                                  onTap: (){
                                    print(Selectedimage);
                                    Selectedimage = mapping.planogramimage[index];
                                    print('https://rms2.rhapsody.ae/product_image/$Selectedimage');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                VeiwImage()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color: orange,
                                        borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Text("Veiw",style: TextStyle(color: Colors.white),),
                                  ),
                                )
                              ],
                            )

                          ],
                        )) : SizedBox();
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
var Selectedimage;
class VeiwImage extends StatelessWidget {
  String url =
      "https://rms2.rhapsody.ae/product_image/$Selectedimage";
  @override
  Widget build(BuildContext context) {
    return PhotoView(
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
    );
  }
}
