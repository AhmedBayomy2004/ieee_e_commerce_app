import 'package:flutter/material.dart';
import 'package:ieee_e_commerce_app/screens/login_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Text(
              "Create Account",
              style: TextStyle(fontSize: 30),
            ),
            Text("Sign up to get started",
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            SizedBox(height: 20),
            InputField(
                label: "Full Name",
                icon: Icon(Icons.contact_mail),
                obscure: false),
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
                        builder: (context) => const Scaffold(body: LogIN()))),
                child: Text(
                  "Register",
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

class InputField extends StatelessWidget {
  const InputField({
    required this.label,
    required this.icon,
    required this.obscure,
    super.key,
  });
  final String label;
  final Icon icon;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          border: Border.all()),
      child: TextField(
          obscureText: obscure,
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              labelText: label,
              icon: icon)),
    );
  }
}
