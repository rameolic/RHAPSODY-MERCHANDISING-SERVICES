
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:merchandising/api/api_service.dart';
import 'package:merchandising/api/holidays.dart';
import 'package:merchandising/main.dart';

Future monthly() async{
  print(DBrequestData);
  http.Response responsedata = await http.post(visitsurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(DBrequestData),
  );
  if (responsedata.statusCode == 200){
    String data = responsedata.body;
    var decodeData = jsonDecode(data);


  }
}


class visits{
  static int jan;
  static int feb;
  static int mar;
  static int apr;
  static int may;
  static int jun;
  static int jul;
  static int aug;
  static int sep;
  static int oct;
  static int nov;
  static int dec;
}