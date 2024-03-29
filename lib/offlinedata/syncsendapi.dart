import 'package:merchandising/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:merchandising/offlinedata/sharedprefsdta.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_launcher_icons/constants.dart';
import 'dart:convert';
import 'package:merchandising/Constants.dart';
import 'package:intl/intl.dart';
import 'syncreferenceapi.dart';

 bool backgroundsyncing  = false;
List<String>requireurlstosync=[];
List<String>requirebodytosync=[];
List<String>message=[];


syncingsenddata()async {
  CreateLog("synchronising data to server started",true);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  lastsyncedon =  DateTime.parse(prefs.getString('lastsyncedondate'));
  requireurlstosync =  prefs.getStringList('addtoserverurl');
  print(lastsyncedon);
  if(requireurlstosync!=null){
    requireurlstosync =  prefs.getStringList('addtoserverurl');
    requirebodytosync =  prefs.getStringList('addtoserverbody');
    message =  prefs.getStringList('addtoservermessage');
  }else{
    requireurlstosync=[];
    requirebodytosync=[];
    message =[];
  }
  print("syncing current data");
    if (requireurlstosync != [] && requireurlstosync != null && onlinemode.value) {    
      for (int i = 0; i < requireurlstosync.length; i++) {
        progress.value++;
        http.Response response = await http.post(
          Uri.parse(requireurlstosync[i]),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${DBrequestdata.receivedtoken}',
          },
          body: requirebodytosync[i],
        );
        if (response.statusCode == 200) {
          print(response.body);
          logreport.add("${requirebodytosync[i]}");
          logtime.add(DateFormat.yMd().add_jm().format(DateTime.now()).toString());
          logreportstatus.add("true");
        } else {
          print(response.body);
          logreport.add(
              "${response.body}");
          logtime.add(DateFormat.yMd().add_jm().format(DateTime.now()).toString());
          logreportstatus.add("false");
        }
        savelogreport(logreport,logtime,logreportstatus);
      }
      requireurlstosync = [];
      requirebodytosync = [];
      message=[];
      removesenddatafromlocal();
  }

}

CreateLog(message,status){
  logreport.add(message);
  logtime.add(DateFormat.yMd().add_jm().format(DateTime.now()).toString());
  logreportstatus.add("$status");
  savelogreport(logreport,logtime,logreportstatus);
}