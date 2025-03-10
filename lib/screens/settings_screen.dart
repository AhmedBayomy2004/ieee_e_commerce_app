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
        setting_row(
            text: "My Orders",
            ic: Icon(Icons.storage),
            func: () => print("My Orders")),
        setting_row(
            text: "Help & Support",
            ic: Icon(Icons.help),
            func: () => print("Help & Support")),
        setting_row(
            text: "About Us",
            ic: Icon(Icons.info),
            func: () => print("About Us")),
        setting_row(
            text: "Change Theme",
            ic: themeProvider.currIcon,
            func: () => themeProvider.updateTheme()),
        Container(
          height: 50,
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout),
                SizedBox(width: 10),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class setting_row extends StatelessWidget {
  setting_row({
    required void Function() this.func,
    required String this.text,
    required this.ic,
    super.key,
  });
  final String text;
  final Icon ic;
  final void Function() func;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: func,
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
