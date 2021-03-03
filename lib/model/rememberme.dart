import 'package:shared_preferences/shared_preferences.dart';
import 'package:merchandising/api/api_service.dart';

addLogindetails() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('useremail', "${loginrequestdata.inputemail}");
  prefs.setString('userpassword', "${loginrequestdata.inputpassword}");
}


removeValues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("useremail");
  prefs.remove("userpassword");
}
class remembereddata {
  static String email;
  static String password;
}


chackdata() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool CheckValue = prefs.containsKey('useremail');
  print(CheckValue);
}