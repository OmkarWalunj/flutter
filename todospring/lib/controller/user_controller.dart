import 'package:flutter/material.dart';
import 'package:todospring/model/user.dart';

class UserController extends ChangeNotifier{
  User? modelobj;
  
  UserController({this.modelobj});
  void changedata(User obj){
    modelobj!.uid=obj.uid;
    modelobj!.email=obj.email;
    modelobj!.userName=obj.userName;
    modelobj!.userName=obj.password;
    notifyListeners();
  }
}