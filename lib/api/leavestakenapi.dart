import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

Future<void> leaveData() async {
  Map body = {
    'emp_id': '${DBrequestdata.receivedempid}'
  };
  http.Response LDresponse = await http.post(LDurl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(body),
  );
  if (LDresponse.statusCode == 200) {
    leavedataResponse.reasons = [];
    leavedataResponse.leavetypes = [];
    leavedataResponse.Startdates = [];
    leavedataResponse.enddates = [];
    leavedataResponse.isleaveaccepted = [];
    leavedataResponse.isleaverejected = [];
    print('leave data done');
    String LDdata = LDresponse.body;
    var decodeLDData = jsonDecode(LDdata);
    for (int u = 0; u< decodeLDData['data'].length; u++) {
      dynamic reason = decodeLDData['data'][u]['reason'];
      leavedataResponse.reasons.add(reason);
      dynamic type = decodeLDData['data'][u]['leavetype'];
      leavedataResponse.leavetypes.add(type);
      dynamic startdate = decodeLDData['data'][u]['leavestartdate'];
      leavedataResponse.Startdates.add(startdate);
      dynamic enddate = decodeLDData['data'][u]['leaveenddate'];
      leavedataResponse.enddates.add(enddate);
      String isrejected = decodeLDData['data'][u]['is_rejected'];
      leavedataResponse.isleaverejected.add(isrejected);
      String isaccepted = decodeLDData['data'][u]['is_approved'];
      leavedataResponse.isleaveaccepted.add(isaccepted);
    }
  }
}


class leavedataResponse{
  static List<dynamic> reasons=[];
  static List<dynamic> leavetypes=[];
  static List<dynamic> Startdates=[];
  static List<dynamic> enddates=[];
  static List<dynamic> isleaverejected=[];
  static List<dynamic> isleaveaccepted=[];
}


class hrresponse{

}

