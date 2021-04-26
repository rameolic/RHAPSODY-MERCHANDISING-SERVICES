import 'package:flutter/material.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'Customers Activities.dart';
import 'MenuContent.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/customer_activites_api/add_shareofshelfapi.dart';
import 'package:merchandising/api/customer_activites_api/share_of_shelf_detailsapi.dart';



class ShareShelf extends StatefulWidget {
  @override
  _ShareShelfState createState() => _ShareShelfState();
}

class _ShareShelfState extends State<ShareShelf> {
  GlobalKey<FormState> soskey = GlobalKey<FormState>();


  List<TextEditingController> actual = [];
  List<String> productlist = ShareData.brandname;
  List<String> total = ShareData.total;
  List<String> target = ShareData.target;
  List<String> share = ShareData.share;



  var _searchview = new TextEditingController();
  bool _firstSearch = true;
  String _query = "";
  List<String> productdata;
  List<String> _filterList;
  List<String> _filetrtarget;
  List<String> _filtertotal;
  List<TextEditingController> _filteractual = [];
  // List<String> _filteractual;

  @override
  void initState() {
    super.initState();
    productdata = productlist;
    productdata.sort();
  }

  _ShareShelfState() {

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
        automaticallyImplyLeading: false,
        backgroundColor: containerscolor,
        iconTheme: IconThemeData(color: orange),
        title: Row(
          children: [
            Row(
              children: [
                Icon(Icons.menu),
                SizedBox(width: 25,),
                Text(
                  'Share of Shelf',
                  style: TextStyle(color: orange),
                ),
              ],
            ),
            Spacer(),
            SubmitButton(
              ontap: ()async{
                AddShareData.brandid = ShareData.brandid;
                AddShareData.outletid = outletrequestdata.outletidpressed;
                AddShareData.timesheetid = '332';//timesheetid.id;
                AddShareData.totalshare = ShareData.total;
                AddShareData.share = ShareData.share;
                AddShareData.target = ShareData.target;
                AddShareData.actual=[];
                for(int i=0;i<productlist.length;i++){
                  AddShareData.actual.add(actual[i].text);
                }
                await addShareofshelfdata();
                print(AddShareData.outletid);
                print(AddShareData.brandid);
                print(AddShareData.timesheetid);
                print(AddShareData.actual);
                if(validateform()==true)
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CustomerActivities()));
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
                      //SizedBox(height: 10.0,),
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
          hintText: 'Search by brand name/Code',
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
      child: new   Form(
        key: soskey,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:productlist.length,
            itemBuilder: (BuildContext context, int index) {
              actual.add(TextEditingController());
              return Container(
                width:double.infinity,
                margin: EdgeInsets.only(top:10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: pink,
                ),

                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,

                  children: [
                    Text('Brand:  ${productlist[index]}',
                        style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: 10,),
                            Text("Total : ${total[index]} meters",style: TextStyle(
                                fontSize: 15.0,
                            )),
                            SizedBox(height: 10,),
                            Text("Share : ${share[index]} meters",style: TextStyle(
                              fontSize: 15.0,
                            )),
                            SizedBox(height: 10,),
                            Text("Target : ${target[index]}%",style: TextStyle(
                                fontSize: 15.0,
                            )),

                          ],
                        ),
                        Column(
                          children: [
                            Text("actual share",style: TextStyle(
                                fontSize: 15.0),),
                            Container(
                              decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: 80,
                              height: 40,
                              padding: EdgeInsets.all(10.0),
                              margin:EdgeInsets.all(10.0),
                              child: Center(
                                child: Center(
                                  child: TextFormField(

                                    keyboardType:
                                    TextInputType.number,

                                    controller: actual[index],
                                    cursorColor: grey,
                                    validator: (input) => !input
                                        .isNotEmpty
                                        ? "actual should not be empty"
                                        : null,
                                    decoration:
                                    new InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      isCollapsed: true,
                                      border: InputBorder.none,
                                      focusColor: orange,
                                      //hintText: "Actual",
                                      hintStyle: TextStyle(
                                        color: grey,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),

              );
            }),
      ),
    );
  }

  Widget _performSearch() {
    _filterList = [];
    _filtertotal = [];
    _filetrtarget = [];
    _filteractual = [];

    for (int i = 0; i <productlist.length; i++) {
      var item = productlist[i];
      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
        int index = productlist.indexOf(item);

        _filtertotal.add(total[index]);
        _filetrtarget.add(target[index]);
        _filteractual.add(actual[index]);


      }
    }
    return _createFilteredListView();
  }

  Widget _createFilteredListView() {
    return new ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount:_filterList.length,
        itemBuilder: (BuildContext context, int index) {
          actual.add(TextEditingController());
          return Container(
            width:double.infinity,
            margin: EdgeInsets.only(top:10.0,right: 10.0,left: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: pink,
            ),

            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,

              children: [
                Text('Brand:  ${_filterList[index]}',
                    style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold
                    )),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Total: ${_filtertotal[index]} meters",style: TextStyle(
                            fontSize: 15.0,fontWeight: FontWeight.bold
                        )),
                        SizedBox(height: 15,),
                        Text("Target: ${_filetrtarget[index]}%",style: TextStyle(
                            fontSize: 15.0,fontWeight: FontWeight.bold
                        )),
                        SizedBox(height: 15,),
                        Text("Share: ${share[index]}%",style: TextStyle(
                            fontSize: 15.0,fontWeight: FontWeight.bold
                        )),


                      ],
                    ),
                    Column(
                      children: [
                        Text("Actual",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 15.0),),
                        Container(
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          width: 60,
                          height: 40,
                          padding: EdgeInsets.all(10.0),
                          margin:EdgeInsets.all(10.0),
                          child: Center(
                            child: Center(
                              child: TextFormField(
                                keyboardType:TextInputType.number,

                                controller: _filteractual[index],
                                cursorColor: grey,
                                validator: (input) => !input
                                    .isNotEmpty
                                    ? "actual should not be empty"
                                    : null,
                                decoration:
                                new InputDecoration(
                                  //contentPadding: ,
                                  isCollapsed: true,
                                  border: InputBorder.none,
                                  focusColor: orange,
                                  //hintText: "Actual",
                                  hintStyle: TextStyle(
                                    color: grey,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),

          );
        });
  }
  bool validateform() {
    final form = soskey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}






class SubmitButton extends StatelessWidget {
  SubmitButton({this.ontap});
  final ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap,
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
