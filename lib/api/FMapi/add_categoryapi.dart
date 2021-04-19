import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_service.dart';
class CategorytoAdd{
  static var name;

}

Future addcategory() async{
  Map category = {
    'category_name' : '${CategorytoAdd.name}',

  };
  http.Response addcategory = await http.post(AddCategory,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
    },
    body: jsonEncode(category),
  );
  print(addcategory.body);
  print("Add Category Done");
}
