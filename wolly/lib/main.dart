import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wolly/Screens/SplaceScreen.dart';

void main() async {
  runApp(WollyApp());
  await GetStorage.init();
}

class WollyApp extends StatelessWidget {
  const WollyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WallyApp",
      debugShowCheckedModeBanner: false,
      home: SplaceScreen(),

    );
  }
}
