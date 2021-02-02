import 'package:merchandising/pages/login_page.dart';
import 'package:merchandising/api/api_service.dart';








class LoginResponseModel {
  final String token;
  final String Empid;

  LoginResponseModel({this.token,this.Empid});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
     Empid: json["user"]["emp_id"] != null ? json["user"]["emp_id"] : "",
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    this.email,
    this.password,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };
    return map;
  }
}

class DashBoardRequestModel {
  DashBoardRequestModel({this.empiddata});
  String empiddata;
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'emp_id': empiddata.trim(),
    };
    return map;
  }
}

class DashBoardResponseModel {
  final String shedulevisits;
  final String unshedulevisits;

  DashBoardResponseModel({this.shedulevisits,this.unshedulevisits});

  factory DashBoardResponseModel.fromJson(Map<String, dynamic> json) {
    return DashBoardResponseModel(
      shedulevisits: json["SheduleCalls"] != null ? json["SheduleCalls"] : "",
      unshedulevisits: json["UnSheduleCalls"] != null ? json["UnSheduleCalls"] : "",
    );
  }
}

