import 'package:flutter/material.dart';
import 'package:ieee_e_commerce_app/api_manager/api_manager.dart';
import 'package:ieee_e_commerce_app/screens/application.dart';
import 'package:ieee_e_commerce_app/screens/signup_screen.dart';

class LogIN extends StatelessWidget {
  LogIN({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
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
                label: "Email Address",
                icon: Icon(Icons.mail),
                obscure: false,
                controller: emailController,
                validator: (val) {}),
            InputField(
                label: "Password",
                icon: Icon(Icons.lock),
                obscure: true,
                controller: passController,
                validator: (val) {}),
            Container(
              width: 200,
              height: 40,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () async {
                  final responce = await ApiManager()
                      .login(emailController.text, passController.text);
                  if (responce != null) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Application()));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Error")));
                  }
                },
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
