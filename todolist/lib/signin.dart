import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State createState() => _SignUp();
}

class _SignUp extends State {
  TextEditingController username = TextEditingController();
  TextEditingController passward = TextEditingController();

  GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(9.0),
      child: Form(
        key: _fromKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(200)),
                    border: Border.all(color: Colors.black)),
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
                height: 20,
              ),
              const Text("Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: username,
                decoration: const InputDecoration(
                  hintText: "Enter UserName",
                  label: Text("UserName"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter username";
                  } else if (value != "OmkarWalunj45") {
                    return "Invalid UserName";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passward,
                obscureText: true,
                obscuringCharacter: "*",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter passward";
                  } else if (value != "Omkar@123") {
                    return "Invalid PassWard";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  hintText: "Enter Passward",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 152, 236, 154))),
                  onPressed: () {
                    bool loginValidated = _fromKey.currentState!.validate();

                    if (loginValidated) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login Successful")));
                          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>const ToDoApp()),
            );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login Failed")));
                    }
                  },
                  child: const Text("Sign In"))
            ],
          ),
        ),
      ),
    ));
  }
}

