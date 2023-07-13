import 'package:flutter/material.dart';
import 'package:social_media_project/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Register",
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
                  "assets/images/register.png",
                  height: 184,
                  width: 300,
                ),
              ),
              SizedBox(height: 35),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2b9348).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
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
              SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF2b9348).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person, color: Color(0xFF2b9348)),
                    hintText: "Username",
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
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
