import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wolly/Screens/HomeScreen.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [

        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
              image: DecorationImage(
                  image: AssetImage("assets/SplaceScreenImage.jpeg"),
                  fit: BoxFit.cover,opacity: 8)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(
                      fontSize: 10,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Wolley",
                  style: TextStyle(
                      fontSize: 50,
                      color: Color(0xff8AFF80),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Find Wallpapers of your choice",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffB0FFA3),
                    fontWeight: FontWeight.w500),
              )),
        ),
      ]),
    );
  }
}
