import 'package:flutter/material.dart';
import 'package:ieee_e_commerce_app/screens/home_screen.dart';
import 'package:ieee_e_commerce_app/screens/search_screen.dart';
import 'package:ieee_e_commerce_app/screens/settings_screen.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  // This widget is the root of your application.
  int currentIndex = 0;
  List<Widget> screens = [HomeScreen(), SearchScreen(), SettingScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings")
          ],
        ));
  }
}
