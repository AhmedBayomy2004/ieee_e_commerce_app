import 'package:flutter/material.dart';
import 'package:ieee_e_commerce_app/screens/application.dart';
import 'package:ieee_e_commerce_app/screens/signup_screen.dart';

class LogIN extends StatelessWidget {
  const LogIN({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 300),
            Text(
              "Welcome Back",
              style: TextStyle(fontSize: 30),
            ),
            Text("Login to continue",
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            SizedBox(height: 20),
            InputField(
                label: "Email Address", icon: Icon(Icons.mail), obscure: false),
            InputField(
                label: "Password", icon: Icon(Icons.lock), obscure: true),
            Container(
              width: 200,
              height: 40,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Application())),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
