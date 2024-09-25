
class TaskDetails{
  List<Data>? data;
  TaskDetails(List<dynamic> json){

    data=[];
    if(json.isNotEmpty){
      json.forEach((model){
          data!.add(Data(model));
      });
    }
  }
}

class Data{
  int ?tid;
  String? cardTitle;
  String? cardDescription;
  String? cardDate;
  bool ? status;
  Data(Map<String,dynamic> model){
    tid=model['tid'];
    cardTitle=model['taskName'];
cardDescription=model['taskDescription'];
cardDate=model['taskDate'];
status=model['status'];
  }
}