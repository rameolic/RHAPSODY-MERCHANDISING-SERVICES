import 'package:shared_preferences/shared_preferences.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:intl/intl.dart';

adduserdetails(logindata) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('logindata', logindata);
  }
lastsynced (date,starttime,endtime) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('lastsyncedondate', "$date");
  prefs.setString('lastsyncedonstarttime', "$starttime");
  prefs.setString('lastsyncedonendtime', "$endtime");
}

 plannedjpweekly(weeklyjplan)async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString("journeyplanweekly",weeklyjplan );
 }
addskippedjpweekly(weeklyjplan)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("skjourneyplanweekly",weeklyjplan );
}
addvisitedjpweekly(weeklyjplan)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("vstjourneyplanweekly",weeklyjplan );
}

 adddailydashboardmerch(dbdaily)async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString("dbdailymerch",dbdaily);
   print("dbdailymerchadded");
 }
adddailymonthlymerch(dbmonthly)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("dbmontlymerch",dbmonthly);
}

addtodayjp(todayjp)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("todayjp",todayjp);
}

addtodayskipped(todayskipped)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("todayskipped",todayskipped);
}

addtodayvisited(todayvisited)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("todayvisited",todayvisited);
}

Addjpoutletsdetailesdata(data)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("alljpoutlets",data);
}

Addjpoutletschartdetailesdata(data)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("alljpoutletschart",data);
}
addempdetailesdata(data)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("empdetails",data);
}


Adddatatoserver(urls,body,meesage)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("addtoserverurl",urls);
  prefs.setStringList("addtoserverbody",body);
  prefs.setStringList("addtoservermessage",meesage);
}
removesenddatafromlocal()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("addtoserverurl");
  prefs.remove("addtoserverbody");
  prefs.remove("addtoservermessage");
}

Expiryreportproducts(data)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("expiryproductsdata",data);
}
addempdetailesreport(data)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("empdetailesreport",data);
}

savelogreport(data,time,status)async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("logdata",data);
  prefs.setStringList("logtime",time);
  prefs.setStringList("status",status);
}

removelogdatafromlocal()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("logdata");
  prefs.remove("logtime");
  prefs.remove("status");
}