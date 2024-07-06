import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:http/http.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.Image});

  final String Image;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String imagePath = '';
  String homewall = "Apply On HomeScreen";
  String result = '';
  bool yes = false;

  downloadImage() async {
    var time = DateTime.now().millisecondsSinceEpoch;
    var path = "/storage/emulated/0/Download/image-$time.jpg";
    var file = File(path);
    var res = await get(Uri.parse(widget.Image.toString()));
    file.writeAsBytes(res.bodyBytes);
    setState(() {});
  }

  save() async {
    var responce = await Dio().get(
      widget.Image,
      options: Options(responseType: ResponseType.bytes),
    );
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(responce.data));
    print(result);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      "Image Downloded..",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
    )));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Color(0xff202020),
        body: DismissiblePage(
          child: Hero(
              tag: "1",
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.Image), fit: BoxFit.cover),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => buildActionSheet(context));
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          bottom: 14,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white60),
                        child: Text(
                          "Set Wallpaper",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    GestureDetector(
                      onTap: () {
                        save();
                        setState(() {});
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          bottom: 14,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white60),
                        child: Text(
                          "Download Image",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          onDismissed: () {
            Navigator.of(context).pop();
          },
          direction: DismissiblePageDismissDirection.multi,
        ));
  }

  Widget buildActionSheet(BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () async {
              setState(() {
                yes = true;
              });
              int location = WallpaperManager.HOME_SCREEN;
              var file =
                  await DefaultCacheManager().getSingleFile(widget.Image);
              setState(() {});
              var result = (await WallpaperManager.setWallpaperFromFile(
                  file.path, location));
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  'Applied Successfully',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )));
                Navigator.pop(context);
              });
              if (mounted) {
                setState(() {
                  yes = false;
                });
              }
            },
            child: Text(
              'Home Screen',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              setState(() {
                yes = true;
              });
              int location = WallpaperManager.LOCK_SCREEN;
              var file =
                  await DefaultCacheManager().getSingleFile(widget.Image);
              setState(() {});
              var result = (await WallpaperManager.setWallpaperFromFile(
                  file.path, location));
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  'Applied Successfully',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )));
                Navigator.pop(context);
              });
              if (mounted) {
                setState(() {
                  yes = false;
                });
              }
            },
            child: Text(
              'Lock Screen',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              setState(() {
                yes = true;
              });
              int location = WallpaperManager.BOTH_SCREEN;
              var file =
                  await DefaultCacheManager().getSingleFile(widget.Image);
              setState(() {});
              var result = (await WallpaperManager.setWallpaperFromFile(
                  file.path, location));
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  'Applied Successfully',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )));
                Navigator.pop(context);
              });
              if (mounted) {
                setState(() {
                  yes = false;
                });
              }
            },
            child: Text(
              'Both Screen',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18))),
      );
}
