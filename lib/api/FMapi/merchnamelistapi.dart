import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';


Future getmerchnamelist() async{
  Map DBrequestData = {
    'emp_id': '${DBrequestdata.receivedempid}'
  };
  http.Response Merchname = await http.post(MercNameList,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(DBrequestData),
  );
  print(Merchname.body);
  if (Merchname.statusCode == 200){
    merchnamelist.employeeid = [];
    merchnamelist.firstname = [];
    merchnamelist.name = [];
    print('reporting details');
    String empdata = Merchname.body;
    var decodeddata = jsonDecode(empdata);
    for(int u=0;u<decodeddata['data'].length;u++) {
      merchnamelist.firstname.add('${decodeddata["data"][u]['first_name']} '
          '${decodeddata["data"][u]['surname']}(${decodeddata["data"][u]['employee_id']})');
      merchnamelist.employeeid.add(decodeddata["data"][u]['employee_id']);
      merchnamelist.name.add('${decodeddata["data"][u]['first_name']} ${decodeddata["data"][u]['surname']}');
    }
  }
  print("MerchandiserNameList Done");
  print(merchnamelist.firstname);
  if(Merchname.statusCode != 200){
    print(Merchname.body);
  }
}

class merchnamelist {
  static List<String> employeeid = [];
  static List<String> firstname=[];
  static List<String> name=[];
}