import 'package:flutter/material.dart';
import 'package:ieee_e_commerce_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        SizedBox(height: 100),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-173524.jpg"),
                fit: BoxFit.fill),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 10),
        Text("Ahmed Bayomy",
            style: TextStyle(
                fontSize: 25,
                //   color: Colors.black,
                fontWeight: FontWeight.bold)),
        Text("UserMail_234567@gmail.com",
            style: TextStyle(fontSize: 15, color: Colors.grey)),
        SizedBox(height: 60),
        setting_row(text: "My Orders", ic: Icon(Icons.storage)),
        setting_row(text: "Help & Support", ic: Icon(Icons.help)),
        setting_row(text: "About Us", ic: Icon(Icons.info)),
        //  setting_row(text: "ChangeTheme", ic: Icon(Icons.light_mode))
        InkWell(
            onTap: () {
              themeProvider.updateTheme();
            },
            child: Container(
              height: 70,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  themeProvider.currIcon,
                  SizedBox(width: 20),
                  Text("Change Theme", style: TextStyle(fontSize: 20)),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ))
      ],
    );
  }
}

class setting_row extends StatelessWidget {
  setting_row({
    required String this.text,
    required this.ic,
    super.key,
  });
  final String text;
  final Icon ic;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => print(text),
        child: Container(
          height: 70,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              ic,
              SizedBox(width: 20),
              Text(text, style: TextStyle(fontSize: 20)),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ));
  }
}
