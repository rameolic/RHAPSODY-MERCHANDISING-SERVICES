import 'package:http/http.dart' as http;
import 'package:merchandising/pages/home.dart';
import 'dart:convert';
import 'package:merchandising/pages/login_page.dart';
import '../model/requestandresponsemodel.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://rms.rhapsody.ae/api/login";

    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 422) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

class APIDashBoard {
  APIDashBoard({this.tokendata});
  String tokendata;
  Future<DashBoardResponseModel> dashboard(DashBoardRequestModel requestModel) async {
    String url = "https://rms.rhapsody.ae/api/dashboard";
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokendata',
        },
        body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 401) {
      print(response.body);

     /* return DashBoardResponseModel.fromJson(
        json.decode(response.body),
      );*/
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
