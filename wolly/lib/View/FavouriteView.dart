import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wolly/View/HomeView.dart';

import '../Screens/DetailScreen.dart';

class FavouriteView extends StatefulWidget {
  FavouriteView({super.key});

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  List<dynamic> Fav = [];

  @override
  void initState() {
    (box.read("Image") == null) ? Fav.isEmpty : Fav = box.read("Image");
    print("-=-=-=-==-=$Fav");
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (Fav.isEmpty)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.favorite,
                                color: CupertinoColors.systemGrey,
                                size: 36,
                                opticalSize: 260,
                              ),
                            ),
                            Text(
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              "There Are No Favorites Wallpaper.\nPlease swipe the tasks on the home page to the left to mark\nthe favourite!",
                              style: TextStyle(
                                  color: CupertinoColors.systemGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: Fav.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          mainAxisExtent: 400),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(Image: Fav[index]),
                                  ));
                            },
                            child: Container(
                              height: 400,
                              margin: EdgeInsets.only(bottom: 8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurStyle: BlurStyle.normal,
                                        offset: Offset(1, 2),
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                        color: Colors.black54)
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff000000),
                                  image: DecorationImage(
                                      image: NetworkImage(Fav[index]),
                                      fit: BoxFit.cover)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              Fav.removeAt(index);
                                              box.remove("Image"[index]);
                                            });
                                          },
                                          icon: Icon(Icons.delete)),
                                    ],
                                  )
                                ],
                              ),
                            ));
                      },
                    ),
                  ),
                ],
              ),
      )),
    );
  }
}
