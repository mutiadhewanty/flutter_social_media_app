import 'package:flutter/material.dart';
import 'package:social_media_project/login.dart';
import 'package:social_media_project/register.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color c = const Color(2B9348);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Welcome",
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
              const Padding(padding: EdgeInsets.symmetric(vertical: 22)),
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/welcome1.png",
                  height: 186,
                  width: 226,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/images/welcome2.png",
                  height: 186,
                  width: 226,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF2b9348),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  )),
              SizedBox(
                height: 33,
              ),
              Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text("Register"),
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
