
class EmployeeDetails1{
  String? status;
  Map<String,dynamic>? data;
  String? message;
  EmployeeDetails1(Map<String,dynamic> json){
    status=json['status'];
    message=json['message'];

    data=json['data'];
  }
}
