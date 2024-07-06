import 'package:flutter/material.dart';
import 'package:wolly/View/CatagoryView.dart';
import 'package:wolly/View/FavouriteView.dart';
import 'package:wolly/View/HomeView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selctedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          elevation: 0,
          backgroundColor: Color(0xff202020),
          shadowColor: Color(0xff202020),
          selectedIndex: selctedIndex,
          indicatorColor: Colors.white,
          onDestinationSelected: (value) {
            setState(() {
              selctedIndex = value;
            });
          },
          destinations: [
        NavigationDestination(icon: Icon(Icons.home_outlined,color:(selctedIndex==0)?Colors.black:Colors.white60), label: ""),
        NavigationDestination(
            icon: Icon(Icons.category_outlined,color:(selctedIndex==1)?Colors.black:Colors.white60), label: ""),
        NavigationDestination(
            icon: Icon(Icons.favorite_border,color:(selctedIndex==2)?Colors.black:Colors.white60), label: ""),
      ]),
      body: (selctedIndex==0)?HomeView():(selctedIndex==1)?CatagoryView():(selctedIndex==2)?FavouriteView():SizedBox(),
    );
  }
}
