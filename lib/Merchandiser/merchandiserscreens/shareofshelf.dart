import 'package:flutter/material.dart';
import '../../Constants.dart';
import 'package:flutter/cupertino.dart';
import 'Customers Activities.dart';
import 'MenuContent.dart';
import'package:merchandising/api/customer_activites_api/share_of_shelf_detailsapi.dart';
import'package:merchandising/api/customer_activites_api/add_shareofshelfapi.dart';

import 'package:merchandising/api/api_service.dart';

List <double> totalshare =[];
List <double> totalshelf =[];
List <double> actualpercent =[];
class ShareShelf extends StatefulWidget {
  @override
  _ShareShelfState createState() => _ShareShelfState();
}

class _ShareShelfState extends State<ShareShelf> {
  GlobalKey<FormState> soskey = GlobalKey<FormState>();


  List<TextEditingController> actual = [];
  List<TextEditingController> share = [];
  List<TextEditingController> total = [];
  List<String> productlist = ShareData.categoryname;
  List<String> target = ShareData.target;



  var _searchview = new TextEditingController();
  bool _firstSearch = true;
  String _query = "";
  List<String> productdata;
  List<String> _filterList;
  List<String> _filetrtarget;
  List<String> _filtertotal;
  List<String> _filtershare;

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
    return GestureDetector(
      onTap: (){

        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: containerscolor,
          iconTheme: IconThemeData(color: orange),
          title: Row(
            children: [
              Text(
                'Share of Shelf',
                style: TextStyle(color: orange),
              ),
              Spacer(),
              SubmitButton(
                ontap: ()async{

                  AddShareData.brandid = ShareData.brandid;
                  AddShareData.outletid = outletrequestdata.outletidpressed;
                  AddShareData.timesheetid = checkinoutdata.checkid;
                  AddShareData.totalshare = ['6','5','4','5.4'];//ShareData.total;
                  AddShareData.categoryname = ShareData.categoryname;
                  AddShareData.share = ['4.5','3','3.5','2.5'];//ShareData.share;
                  AddShareData.target = ShareData.target;
                  AddShareData.actual=[];
                  for(int i=0;i<productlist.length;i++){
                   AddShareData.actual.add(actual[i].text);


                  }

                  await addShareofshelfdata();
                  print(AddShareData.categoryname);
                  print(AddShareData.outletid);
                  print(AddShareData.brandid);
                  print(AddShareData.timesheetid);
                  print(AddShareData.actual);
                  print('target is: ${AddShareData.target}');

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
          hintText: 'Search by catergory name',
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
      child: new Form(
        key: soskey,
        child: ListView.builder(
           // physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:target.length,
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
                    Text('Category :${ShareData.categoryname[index]}',
                        style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: orange
                        )),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Target: ${target[index]} %",style: TextStyle(
                            fontSize: 15.0
                        )),
                        SizedBox(height: 10,),

                        Container(
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(10.0),
                          margin:EdgeInsets.only(top:10.0),
                          child: Center(
                            child: Center(
                              child: TextFormField(
                                onChanged: (value){},
                                keyboardType: TextInputType.number,
                                controller: total[index],
                                cursorColor: grey,
                                validator: (input) => !input
                                    .isNotEmpty
                                    ? "total should not be empty"
                                    : null,
                                decoration:
                                new InputDecoration(
                                  //contentPadding: ,
                                  isCollapsed: true,
                                  border: InputBorder.none,
                                  focusColor: orange,
                                  hintText: "Total Shelf in meters",
                                  hintStyle: TextStyle(
                                    color: grey,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(10.0),
                          margin:EdgeInsets.only(top:10.0),
                          child: Center(
                            child: Center(
                              child: TextFormField(
                                onChanged: (value){
                                },
                                keyboardType:
                                TextInputType.number,

                                controller: share[index],
                                cursorColor: grey,
                                validator: (input) => !input
                                    .isNotEmpty
                                    ? "Share should not be empty"
                                    : null,
                                decoration:
                                new InputDecoration(
                                  //contentPadding: ,
                                  isCollapsed: true,
                                  border: InputBorder.none,
                                  focusColor: orange,
                                  hintText: "Share of ${ShareData.categoryname[index]} in meters",
                                  hintStyle: TextStyle(
                                    color: grey,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(10.0),
                          margin:EdgeInsets.only(top:10.0),
                          child: Center(
                            child: Center(
                              child: TextFormField(
                                onChanged: (value){
                                  // ignore: unrelated_type_equality_checks
                                  if(double.parse(value) <= double.parse(share[index].text)){
                                    setState(() {
                                      actualpercent[index] = (double.parse(value)/double.parse(share[index].text))*100;
                                    });
                                  }else{
                                    setState(() {
                                      actualpercent[index] = 101;
                                    });
                                  }
                                },
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
                                  //contentPadding: ,
                                  isCollapsed: true,
                                  border: InputBorder.none,
                                  focusColor: orange,
                                  hintText: "Actual in meters",
                                  hintStyle: TextStyle(
                                    color: grey,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10),
                        actualpercent[index]<100?Text("Actual Percent: ${actualpercent[index].toStringAsFixed(2)}%",style: TextStyle(color: Colors.red),):

                        actualpercent[index] == 101 ?Text("Actual Percent : actual cannot be greater than share",style: TextStyle(color: Colors.red),):Text("Actual Percent : "
                            "${actualpercent[index].toStringAsFixed(2)}%",style: TextStyle(color: Colors.green),),
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
    _filtershare = [];
    _filteractual = [];

    for (int i = 0; i <ShareData.categoryname.length; i++) {
      var item = ShareData.categoryname[i];
      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);

        int index = ShareData.categoryname.indexOf(item);
        _filtertotal.add(total[index].text);
        _filetrtarget.add(target[index]);
        _filteractual.add(actual[index]);
        _filtershare.add(share[index].text);
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
                Text('Category:  ${_filterList[index]}',
                    style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: orange
                    )),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Total: ${_filtertotal[index]} meters",style: TextStyle(
                            fontSize: 15.0,
                        )),
                        SizedBox(height: 15,),
                        Text("Target: ${_filetrtarget[index]} %",style: TextStyle(
                            fontSize: 15.0,
                        )),
                        SizedBox(height: 15,),
                        Text("Share: ${_filtershare[index]} %",style: TextStyle(
                            fontSize: 15.0,
                        )),
                        SizedBox(height: 15,),
                        Text("Actual: ${_filteractual[index].text}",style: TextStyle(fontSize: 15),)


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
