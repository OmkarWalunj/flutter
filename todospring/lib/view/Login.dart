import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todospring/controller/user_controller.dart';
import 'package:todospring/model/user.dart';
import 'package:todospring/view/signup.dart';
import 'package:http/http.dart' as http;
import 'package:todospring/view/todo.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
              width: 400,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.circular(200)),
                border: Border.all(color: Colors.black),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(200)),
                child: Image.network(
                  "https://imgs.search.brave.com/4QP6vTyCV-RT5zOVezSDF7y_oztDjtVNFxPKhkdesQk/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/dzNzY2hvb2xzLmNv/bS93M2ltYWdlcy9h/dmF0YXIyLnBuZw",
                  fit: BoxFit.cover,
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login to your Account",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: name,
                    decoration:const InputDecoration(
                      hintText: "Username",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  
                  decoration:const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.15),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    obscureText: true,
                obscuringCharacter: "*",
                    controller:password,
                    decoration:const InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: loginUser,
                  child: Container(
                    width: 300,
                    height: 49,
                    decoration:const BoxDecoration(
                      color: Color.fromRGBO(14, 161, 125, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Text(
                  "Don’t have an account?",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    " Sign up",
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(14, 161, 125, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const SignupScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void loginUser() async {
    
     Uri url=Uri.parse("http://10.0.2.2:8080/signin");
    http.Response resourse= await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userName': name.text,
        'password': password.text,
      }));
      // var resourseData=json.decode(resourse.body);
      Map<String,dynamic> udata=jsonDecode(resourse.body);
      log("$udata");
    WidgetsBinding.instance.addPostFrameCallback((_) {
        Provider.of<UserController>(context, listen: false).changedata(
          User.data(
            udata["uid"],
            udata["userName"],
            udata["email"],
            udata["password"],
          ),
        );
        log("${Provider.of<UserController>(context, listen: false).modelobj!.uid!}");
      });
    if (resourse.statusCode == 200) {
      print('User authenticated successfully!');
      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login Successful")));
       Navigator.push(context,   MaterialPageRoute<void>(
      builder: (BuildContext context) => const ToDoApp(),
    ),);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Failed to authenticate user.")));
      print('Failed to authenticate user.');
     
    }
    // var resourseData=json.decode(resourse.body);
     log(resourse.body);
  }
}
