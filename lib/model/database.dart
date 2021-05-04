import 'package:merchandising/Merchandiser/merchandiserscreens/expiry_report.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:mysql1/mysql1.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class databse{
  static var settings = new ConnectionSettings(
      host: 'mars.us-win.bisend.com',
      port: 3306,
      user: 'testmobileapp',
      password: 'TestMobileApp@2021',
      db: 'testmobileapp'
  );
}
List<dynamic>addedproductid=[];
getaddedsku()async{
  var conn = await MySqlConnection.connect(databse.settings);
  var receiveddata = await conn.query("select product_id,near_expiry_in_pc,pc_expiry_date from stock_expiry where action_to_be_filled_by_cde = '$currentmerchid';");
  print(receiveddata);
  if(receiveddata!=null){
    for(int i = 0; i < receiveddata.length; i++){
      addedproductid.add(receiveddata.toList()[i]["product_id"]);
      print(addedproductid);
      addeditemscount.add(receiveddata.toList()[i]["near_expiry_in_pc"]);
      addedexpirydate.add(DateFormat.yMd().format(receiveddata.toList()[i]["pc_expiry_date"]));
    }
    print(addedexpirydate);
    for(int i = 0; i < addedproductid.length; i++){
      print(i);
      if(Expiry.id.contains(addedproductid[i])){
        int index = Expiry.id.indexOf(addedproductid[i]);
        addedsku.add('${Expiry.zrepcodes[index]}-${Expiry.sku[index]}');
      }
    }
  }
  print(addedsku);
}

// getproducts()async{
//   var conn = await MySqlConnection.connect(databse.settings);
//   var data = await conn.query('select id,zrep,material_description,barcode_cs,barcode_bs,barcode_pc from product');
//   if(data!=null){
//     for(int i = 0; i < data.length; i++){
//       Expiry.id.add(data.toList()[i]["id"]);
//       Expiry.zrepcodes.add(data.toList()[i]["zrep"]);
//       Expiry.sku.add(data.toList()[i]["material_description"]);
//       Expiry.barcode_bs.add(data.toList()[i]["barcode_cs"]);
//       Expiry.barcode_cs.add(data.toList()[i]["barcode_bs"]);
//       Expiry.barcode_ps.add(data.toList()[i]["barcode_pc"]);
//     }
//     print( Expiry.id.length);
//     print( Expiry.zrepcodes.length);
//     print( Expiry.sku.length);
//     print( Expiry.barcode_bs.length);
//     print( Expiry.barcode_cs.length);
//     print( Expiry.barcode_ps.length);
//   }
//   await getaddedsku();
//   return "done";
// }

class Expiry{

  static List<int>id=[];
  static List<String>zrepcodes=[];
  static List<String>sku=[];
  static List<String>barcode_cs=[];
  static List<String>barcode_bs=[];
  static List<String>barcode_ps=[];
}

// AddData()async{
//   var conn = await MySqlConnection.connect(databse.settings);
//   print('insert into stock_expiry( customer_outlet_id, product_id, copack_regular, near_expiry_in_pc, pc_expiry_date, period, exposure_qty_will_expire_in_pc, price_pc, near_expiry_in_cs, price_cs, cs_expiry_date, near_expiry_in_bs, price_bs, bs_expiry_date, exposure_expiry_in_cs, exposure_expiry_in_bs, action_to_be_filled_by_cde, client_id, remarks) values(    \"$Storecode\", \"$productid\",\"$packtypeselected\",   \"$expirypc\",\"$pcexpirydate\",\"$periodchoosed\",   \"$exposureqntypc\",    \"$pricepc\",   \"$expirycs\",\"$pricecs\",\"$csexpirydate\",\"$expirybs\", \"$pricebs\",\"$bsexpirydate\",\"$exposureqntycs\",\"$exposureqntybs\",\"${DBrequestdata.receivedempid}\",\"0\",\"$remarksifany\")');
//   await conn.query('insert into stock_expiry( customer_outlet_id, product_id, copack_regular, near_expiry_in_pc, pc_expiry_date, period, exposure_qty_will_expire_in_pc, price_pc, near_expiry_in_cs, price_cs, cs_expiry_date, near_expiry_in_bs, price_bs, bs_expiry_date, exposure_expiry_in_cs, exposure_expiry_in_bs, action_to_be_filled_by_cde, client_id, remarks) '
//       'values(    \"$Storecode\", \"$productid\",\"$packtypeselected\",   \"$expirypc\",\"$pcexpirydate\",\"$periodchoosed\",   \"$exposureqntypc\",    \"$pricepc\",   \"$expirycs\",\"$pricecs\",\"$csexpirydate\",\"$expirybs\", \"$pricebs\",\"$bsexpirydate\",\"$exposureqntycs\",\"$exposureqntybs\",\"${DBrequestdata.receivedempid}\",\"0\",\"$remarksifany\")');
//   return true;
//
// }
var Storecode;
var productid;
var packtypeselected;
var expirypc;
var pcexpirydate;
var periodchoosed;
var exposureqntypc;
var pricepc;
var expirycs;
var csexpirydate;
var exposureqntycs;
var pricecs;
var expirybs;
var bsexpirydate;
var exposureqntybs;
var pricebs;
var filledby;
var remarksifany;


Future getstockexpiryproducts() async{
  http.Response Response = await http.post(stockexpiryDetails,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
  );
  if (Response.statusCode == 200){
    print("stockexpirydone");
    String brand = Response.body;
    var decodebrands = jsonDecode(brand);
    for(int u=0;u<decodebrands['data'].length;u++) {
      Expiry.id.add(decodebrands['data'][u]["id"]);
      Expiry.zrepcodes.add(decodebrands['data'][u]["zrep"]);
      Expiry.sku.add(decodebrands['data'][u]["material_description"]);
      Expiry.barcode_bs.add(decodebrands['data'][u]["barcode_bs"]);
      Expiry.barcode_cs.add(decodebrands['data'][u]["barcode_cs"]);
      Expiry.barcode_ps.add(decodebrands['data'][u]["barcode_pc"]);
    }
  }
}

Future addexpiryproducts() async{
  Map stockdata = {
    "customer_outlet_id": "$Storecode",
    "product_id": "$productid",
    "copack_regular": "$packtypeselected",
    "near_expiry_in_pc": "$expirypc",
    "price_pc":"$pricepc",
    "pc_expiry_date": "$pcexpirydate",
    "period": "$periodchoosed",
    "exposure_qty_will_expire_in_pc": "$exposureqntypc",
    "price_cs": "0",
    "cs_expiry_date": "$pcexpirydate",
    "bs_expiry_date": "$pcexpirydate",
    "near_expiry_in_bs": "0",
    "price_bs": "0",
    "exposure_expiry_in_cs": "0",
    "exposure_expiry_in_bs": "0",
    "action_to_be_filled_by_cde": "${DBrequestdata.receivedempid}",
    "client_id": "0"
  };
  http.Response Response = await http.post(addexpiryDetails,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
       body: jsonEncode(stockdata),
  );
  print(Response.body);
  }
//
// Future getaddedexpiryproducts() async{
//   http.Response Response = await http.post(stockexpiryDetails,
//     headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
//     },
//   );
//   if (Response.statusCode == 200){
//     String brand = Response.body;
//     var decodebrands = jsonDecode(brand);
//     for(int u=0;u<decodebrands['data'].length;u++) {
//       addedproductid.add(decodebrands['data'][u]["id"]);
//       addeditemscount.add(decodebrands['data'][u]["zrep"]);
//       Expiry.sku.add(decodebrands['data'][u]["material_description"]);
//       Expiry.barcode_bs.add(decodebrands['data'][u]["barcode_bs"]);
//       Expiry.barcode_cs.add(decodebrands['data'][u]["barcode_cs"]);
//       Expiry.barcode_ps.add(decodebrands['data'][u]["barcode_pc"]);
//     }
//     for(int i = 0; i < decodebrands['data'].length; i++){
//       addedproductid.add(receiveddata.toList()[i]["product_id"]);
//       print(addedproductid);
//       addeditemscount.add(receiveddata.toList()[i]["near_expiry_in_pc"]);
//       addedexpirydate.add(DateFormat.yMd().format(receiveddata.toList()[i]["pc_expiry_date"]));
//     }
//     print(addedexpirydate);
//     for(int i = 0; i < addedproductid.length; i++){
//       print(i);
//       if(Expiry.id.contains(addedproductid[i])){
//         int index = Expiry.id.indexOf(addedproductid[i]);
//         addedsku.add('${Expiry.zrepcodes[index]}-${Expiry.sku[index]}');
//       }
//     }
//   }
//   }
