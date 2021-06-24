import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
//import 'package:merchandising/main.dart';
Future<void> clientpromodata() async {
  Map DBrequestData = {
    'outlet_id': currentoutletid
  };
  print(jsonEncode(DBrequestData));
  http.Response promoresponse = await http.post(clientpromodataurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(DBrequestData),
  );
  print(promoresponse.body);
  if (promoresponse.statusCode == 200){
    print("getPromotion Details Done");
    String stores = promoresponse.body;
    var decodestores = jsonDecode(stores);
    clientpromo.reason = [];
    clientpromo.productname = [];
    clientpromo.imageurl = [];
    clientpromo.productnameoos = [];
    for(int u=0;u<decodestores['data'].length;u++) {
      if('${decodestores['data'][u]['is_available']}'=='1'){
        clientpromo.productname.add(decodestores['data'][u]['product_name']);
        clientpromo.imageurl.add('https://rms2.rhapsody.ae/promotion_image/${decodestores['data'][u]['image_url']}');
      }else{
        clientpromo.productnameoos.add(decodestores['data'][u]['product_name']);
        clientpromo.reason.add(decodestores['data'][u]['reason']);
      }
      clientpromo.product.add(decodestores['data'][u]['product_name']);
      clientpromo.status.add(decodestores['data'][u]['is_available']);
      clientpromo.reasonnimg.add(
          '${decodestores['data'][u]['is_available']}'=='1' ?
          'https://rms2.rhapsody.ae/promotion_image/${decodestores['data'][u]['image_url']}':
          decodestores['data'][u]['reason']
      );
    }
    print(clientpromo.productname);
  }
  if(promoresponse.statusCode != 200){
    print(promoresponse.statusCode);

  }
}

class clientpromo {
  static List<String> reason = [];
  static List<String> imageurl = [];
  static List<String> productname = [];
  static List<String> productnameoos = [];

  static List<String> product = [];
  static List<String> status = [];
  static List<String> reasonnimg = [];
}