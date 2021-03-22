import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
import 'storedetailsapi.dart';


Future getFMoutletdetails() async{
  Map DBrequestData = {
    'emp_id': '${DBrequestdata.receivedempid}'
  };
  http.Response OutletDetails = await http.post(OCurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(DBrequestData),
  );
  if (OutletDetails.statusCode == 200){
    print("getOutlet Details Done");
    String outletdetdata = OutletDetails.body;
    var decodeoutlet = jsonDecode(outletdetdata);
    outletdata.outletid=[];
    outletdata.contactnumber = [];
    outletdata.outletname = [];
    outletdata.outletlat = [];
    outletdata.outletlong = [];
    outletdata.outletarea = [];
    outletdata.outletcity = [];
    outletdata.outletstate = [];
    outletdata.outletcountry = [];
    outletdata.address = [];
    outletdata.code = [];
    for(int u=0;u<decodeoutlet['data'].length;u++) {
      outletdata.contactnumber.add(decodeoutlet['data'][u]['store'][0]['contact_number']);
      outletdata.address.add(decodeoutlet['data'][u]['store'][0]['address']);
      outletdata.outletid.add(decodeoutlet['data'][u]['outlet_id']);
      dynamic code = decodeoutlet['data'][u]['store'][0]['store_code'];
      outletdata.code.add(code);
      dynamic outletname = decodeoutlet['data'][u]['store'][0]['store_name'];
      outletdata.outletname.add('[$code] $outletname');
      dynamic outletlat = decodeoutlet['data'][u]['outlet_lat'];
      outletdata.outletlat.add(outletlat);
      dynamic outletlong = decodeoutlet['data'][u]['outlet_long'];
      outletdata.outletlong.add(outletlong);
      dynamic outletarea = decodeoutlet['data'][u]['outlet_area'];
      outletdata.outletarea.add(outletarea);
      dynamic outletcity = decodeoutlet['data'][u]['outlet_city'];
      outletdata.outletcity.add(outletcity);
      dynamic outletstate = decodeoutlet['data'][u]['outlet_state'];
      outletdata.outletstate.add(outletstate);
      dynamic outletcountry = decodeoutlet['data'][u]['outlet_country'];
      outletdata.outletcountry.add(outletcountry);
    }
    await getStoreDetails();
    store.addoutlet=[];
    store.storeid=[];
    for(int u=0;u<storesdata.storename.length;u++){
        if(outletdata.outletname.contains(storesdata.storename[u])){
        }else{
          store.addoutlet.add(storesdata.storename[u]);
          store.storeid.add(storesdata.id[u]);
        }
    }

  }
  if(OutletDetails.statusCode != 200){
    print(OutletDetails.statusCode);

  }
}

class outletdata {
  static List<int> outletid=[];
  static List<dynamic> contactnumber= [];
  static List<String> outletname= [];
  static List<dynamic> outletlat= [];
  static List<dynamic> outletlong=[];
  static List<dynamic> outletarea= [];
  static List<dynamic> outletcity= [];
  static List<dynamic> outletstate= [];
  static List<dynamic> outletcountry=[];
  static List<dynamic> address=[];
  static List<dynamic> code=[];

}
class store{
  static List<String> addoutlet=[];
  static List<int> storeid = [];
}