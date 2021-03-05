import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../api_service.dart';
import 'package:intl/intl.dart';

Future<void> getVisitJourneyPlanweekly() async {
  http.Response JPresponse = await http.post(
    WJPVisitedurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(DBrequestData),
  );
  if (JPresponse.statusCode == 200) {
    print('journey plan weekly visited done');
    String JPdata = JPresponse.body;
    var decodeJPData = jsonDecode(JPdata);
    for (int u = 0; u <decodeJPData['data'].length; u++) {
      dynamic storename = decodeJPData['data'][u]['store_name'];

      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Sunday'
          : decodeJPData['data'][u]['day'] == 'Sunday') {
        getweeklyvisitjp.sundaystorenames.add(storename);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Monday'
          : decodeJPData['data'][u]['day'] == 'Monday') {
        getweeklyvisitjp.mondaystorenames.add(storename);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Tuesday'
          : decodeJPData['data'][u]['day'] == 'Tuesday') {
        getweeklyvisitjp.tuesdaystorenames.add(storename);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Wednesday'
          : decodeJPData['data'][u]['day'] == 'Wednesday') {
        getweeklyvisitjp.wednesdaystorenames.add(storename);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Thursday'
          : decodeJPData['data'][u]['day'] == 'Thursday') {
        getweeklyvisitjp.thrusdaystorenames.add(storename);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Friday'
          : decodeJPData['data'][u]['day'] == 'Friday') {
        getweeklyvisitjp.fridaystorenames.add(storename);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Saturday'
          : decodeJPData['data'][u]['day'] == 'Saturday') {
        getweeklyvisitjp.saturdaystorenames.add(storename);
      }

      dynamic storecode = decodeJPData['data'][u]['store_code'];


      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Sunday'
          : decodeJPData['data'][u]['day'] == 'Sunday') {
        getweeklyvisitjp.sundaystorecodes.add(storecode);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Monday'
          : decodeJPData['data'][u]['day'] == 'Monday') {
        getweeklyvisitjp.mondaystorecodes.add(storecode);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Tuesday'
          : decodeJPData['data'][u]['day'] == 'Tuesday') {
        getweeklyvisitjp.tuesdaystorecodes.add(storecode);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Wednesday'
          : decodeJPData['data'][u]['day'] == 'Wednesday') {
        getweeklyvisitjp.wednesdaystorecodes.add(storecode);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Thursday'
          : decodeJPData['data'][u]['day'] == 'Thursday') {
        getweeklyvisitjp.thrusdaystorecodes.add(storecode);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Friday'
          : decodeJPData['data'][u]['day'] == 'Friday') {
        getweeklyvisitjp.fridaystorecodes.add(storecode);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Saturday'
          : decodeJPData['data'][u]['day'] == 'Saturday') {
        getweeklyvisitjp.saturdaystorecodes.add(storecode);
      }
      dynamic address = decodeJPData['data'][u]['address'];


      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Sunday'
          : decodeJPData['data'][u]['day'] == 'Sunday') {
        getweeklyvisitjp.sundayaddress.add(address);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Monday'
          : decodeJPData['data'][u]['day'] == 'Monday') {
        getweeklyvisitjp.mondayaddress.add(address);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Tuesday'
          : decodeJPData['data'][u]['day'] == 'Tuesday') {
        getweeklyvisitjp.tuesdayaddress.add(address);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Wednesday'
          : decodeJPData['data'][u]['day'] == 'Wednesday') {
        getweeklyvisitjp.wednesdayaddress.add(address);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Thursday'
          : decodeJPData['data'][u]['day'] == 'Thursday') {
        getweeklyvisitjp.thrusdayaddress.add(address);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Friday'
          : decodeJPData['data'][u]['day'] == 'Friday') {
        getweeklyvisitjp.fridayaddress.add(address);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Saturday'
          : decodeJPData['data'][u]['day'] == 'Saturday') {
        getweeklyvisitjp.saturdayaddress.add(address);
      }


      dynamic numbers = decodeJPData['data'][u]['contact_number'];

      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Sunday'
          : decodeJPData['data'][u]['day'] == 'Sunday') {
        getweeklyvisitjp.sundaycontactnumbers.add(numbers);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Monday'
          : decodeJPData['data'][u]['day'] == 'Monday') {
        getweeklyvisitjp.mondaycontactnumbers.add(numbers);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Tuesday'
          : decodeJPData['data'][u]['day'] == 'Tuesday') {
        getweeklyvisitjp.tuesdaycontactnumbers.add(numbers);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Wednesday'
          : decodeJPData['data'][u]['day'] == 'Wednesday') {
        getweeklyvisitjp.wednesdaycontactnumbers.add(numbers);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Thursday'
          : decodeJPData['data'][u]['day'] == 'Thursday') {
        getweeklyvisitjp.thrusdaycontactnumbers.add(numbers);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Friday'
          : decodeJPData['data'][u]['day'] == 'Friday') {
        getweeklyvisitjp.fridaycontactnumbers.add(numbers);
      }
      if (decodeJPData['data'][u]['day'] == null
          ? DateFormat('EEEE').format(DateFormat("yyyy-MM-dd")
          .parse(decodeJPData['data'][u]['date'])) == 'Saturday'
          : decodeJPData['data'][u]['day'] == 'Saturday') {
        getweeklyvisitjp.saturdaycontactnumbers.add(numbers);
      }
    }
  } else {
    print(JPresponse.statusCode);
  }
}

class getweeklyvisitjp {
  static List<String> sundaystorecodes = [];
  static List<String> mondaystorecodes = [];
  static List<String> tuesdaystorecodes = [];
  static List<String> wednesdaystorecodes = [];
  static List<String> thrusdaystorecodes = [];
  static List<String> fridaystorecodes = [];
  static List<String> saturdaystorecodes = [];

  static List<String> sundaystorenames = [];
  static List<String> mondaystorenames = [];
  static List<String> tuesdaystorenames = [];
  static List<String> wednesdaystorenames = [];
  static List<String> thrusdaystorenames = [];
  static List<String> fridaystorenames = [];
  static List<String> saturdaystorenames = [];

  static List<String> sundayaddress = [];
  static List<String> mondayaddress = [];
  static List<String> tuesdayaddress = [];
  static List<String> wednesdayaddress = [];
  static List<String> thrusdayaddress = [];
  static List<String> fridayaddress = [];
  static List<String> saturdayaddress = [];

  static List<int> sundaycontactnumbers = [];
  static List<int> mondaycontactnumbers = [];
  static List<int> tuesdaycontactnumbers = [];
  static List<int> wednesdaycontactnumbers = [];
  static List<int> thrusdaycontactnumbers = [];
  static List<int> fridaycontactnumbers = [];
  static List<int> saturdaycontactnumbers = [];
}
