
class EmployeeDetails{
  String? status;
  List<Data>? data;
  String? message;
  EmployeeDetails(Map<String,dynamic> json){
    status=json['status'];
    message=json['message'];

    data=[];
    if(json['data'].isNotEmpty){
      json['data'].forEach((model){
          data!.add(Data(model));
      });
    }
  }
}

class Data{
  int? id;
  String? empName;
  int? empsal;
  int? empage;
  String? profileimg;
  Data(Map<String,dynamic> model){
    id=model['id'];
    empName=model['employee_name'];
    empsal=model['employee_salary'];
    empage=model['employee_age'];
    profileimg=model['profile_image'];
  }
}