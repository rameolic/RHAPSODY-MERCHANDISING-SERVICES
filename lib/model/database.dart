import 'package:merchandising/api/api_service.dart';
import 'package:mysql1/mysql1.dart';
class databse{
  static var settings = new ConnectionSettings(
      host: 'mars.us-win.bisend.com',
      port: 3306,
      user: 'testmobileapp',
      password: 'TestMobileApp@2021',
      db: 'testmobileapp'
  );
}

getproducts()async{
  var conn = await MySqlConnection.connect(databse.settings);
  var data = await conn.query('select id,zrep,material_description,barcode_cs,barcode_bs,barcode_pc from product');
  if(data!=null){
    for(int i = 0; i < data.length; i++){
      Expiry.id.add(data.toList()[i]["id"]);
      Expiry.zrepcodes.add(data.toList()[i]["zrep"]);
      Expiry.sku.add(data.toList()[i]["material_description"]);
      Expiry.barcode_bs.add(data.toList()[i]["barcode_cs"]);
      Expiry.barcode_cs.add(data.toList()[i]["barcode_bs"]);
      Expiry.barcode_ps.add(data.toList()[i]["barcode_pc"]);
    }
    print( Expiry.id.length);
    print( Expiry.zrepcodes.length);
    print( Expiry.sku.length);
    print( Expiry.barcode_bs.length);
    print( Expiry.barcode_cs.length);
    print( Expiry.barcode_ps.length);
  }
  return "done";
}

class Expiry{

  static List<int>id=[];
  static List<String>zrepcodes=[];
  static List<String>sku=[];
  static List<String>barcode_cs=[];
  static List<String>barcode_bs=[];
  static List<String>barcode_ps=[];
}

AddData()async{
  var conn = await MySqlConnection.connect(databse.settings);
  await conn.query('insert into stock_expiry( customer_outlet_id, product_id, copack_regular, near_expiry_in_pc, pc_expiry_date, period, exposure_qty_will_expire_in_pc, price_pc, near_expiry_in_cs, price_cs, cs_expiry_date, near_expiry_in_bs, price_bs, bs_expiry_date, exposure_expiry_in_cs, exposure_expiry_in_bs, action_to_be_filled_by_cde, client_id, remarks) '
      'values(    \"$Storecode\", \"$productid\",\"$packtypeselected\",   \"$expirypc\",\"$pcexpirydate\",\"$periodchoosed\",   \"$exposureqntypc\",    \"$pricepc\",   \"$expirycs\",\"$pricecs\",\"$csexpirydate\",\"$expirybs\", \"$pricebs\",\"$bsexpirydate\",\"$exposureqntycs\",\"$exposureqntybs\",\"${DBrequestdata.receivedempid}\",\"0\",\"$remarksifany\")');
  return true;
}
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


