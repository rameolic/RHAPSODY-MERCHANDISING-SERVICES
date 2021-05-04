import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
class Checklistdata{
  static var outletid;
  static List<String> tasklist=[];

}

Future addchecklistdata() async{
  Map data = {
    'outlet_id' : '${Checklistdata.outletid}',
    'task_list' : '${Checklistdata.tasklist}',

  };
  http.Response response = await http.post(AddTaskList,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(data),
  );
   print(data);
   print("Add Check List Done");



   print(response.body);
}





