import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media_project/home.dart';

import 'sharedPreference/shared_pref.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  var baseUrl = "https://b517-103-17-77-3.ngrok-free.app/api";
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> login() async {
      var dio = Dio();
      try {
        var response = await dio.post("$baseUrl/login", data: {
          "email": emailController.text,
          "password": passwordController.text
        });
        SharedPref.pref?.setString("token", response.data['data']['token']);
        print(response.data['data']['token']);
        print(response);
      } catch (e) {
        print("Login gagal");
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 22)),
              Center(
                child: Image.asset(
                  "assets/images/login.png",
                  height: 184,
                  width: 300,
                ),
              ),
              SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2b9348).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email, color: Color(0xFF2b9348)),
                    hintText: "E-mail",
                    hintStyle: TextStyle(color: Colors.black26),
                    filled: true,
                    fillColor: Colors.transparent,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF2b9348),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2b9348).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF2b9348)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF2b9348),
                      ),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black26),
                    filled: true,
                    fillColor: Colors.transparent,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF2b9348),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 49,
              ),
              Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      print(emailController.text);
                      print(passwordController.text);
                      await login();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF2b9348),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
