import 'package:flutter/material.dart';
import 'package:ieee_e_commerce_app/api_manager/api_manager.dart';
import 'package:ieee_e_commerce_app/screens/login_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    return SingleChildScrollView(
      child: Center(
        child: Form(
          key: _formKey,
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
                  obscure: false,
                  validator: (input) => input!.isValidName()
                      ? null
                      : "Name must be between 2 and 50 characters long and contain only letters and spaces.",
                  controller: nameController),
              InputField(
                  label: "Email Address",
                  icon: Icon(Icons.mail),
                  obscure: false,
                  validator: (input) => input!.isValidEmail()
                      ? null
                      : "Check your email address.",
                  controller: emailController),
              InputField(
                  label: "Password",
                  icon: Icon(Icons.lock),
                  obscure: true,
                  validator: (input) => input!.isValidPass()
                      ? null
                      : "Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character (!@#\$&*~).",
                  controller: passController),
              Container(
                width: 200,
                height: 40,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) => Center(
                                  child: CircularProgressIndicator(
                                color: Colors.grey,
                              )));
                      final responce = await ApiManager().register(
                          nameController.text,
                          emailController.text,
                          passController.text);
                      Navigator.pop(context);
                      if (responce != null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Success")));
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Scaffold(body: LogIN())));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Error")));
                      }
                    }

                    /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Scaffold(body: LogIN())));*/
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
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
    required this.validator,
    required this.controller,
    super.key,
  });
  final String label;
  final Icon icon;
  final bool obscure;
  final TextEditingController controller;
  final String? Function(String?) validator;
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
      child: TextFormField(
          obscureText: obscure,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              labelText: label,
              icon: icon)),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PassValidator on String {
  bool isValidPass() {
    return RegExp(r'^[a-zA-Z0-9]{8,}$').hasMatch(this);
  }
}

extension NameValidator on String {
  bool isValidName() {
    return RegExp(r"^[a-zA-Z\s]{2,50}$").hasMatch(this);
  }
}
