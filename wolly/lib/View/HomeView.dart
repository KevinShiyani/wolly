import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wolly/Screens/DetailScreen.dart';

final box = GetStorage();
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var query;

  searchWallpaper(String query) async {
    final responce = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=40"),
        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });

    if (responce.statusCode == 200) {
      isLoding2 = true;
      setState(() {});

      //print(responce.body);
      var jsonda = jsonDecode(responce.body);
      setState(() {});

      for (i in jsonda['photos']) {
        setState(() {
          i = i;
        });
      }
      searchImage = jsonda["photos"];
      setState(() {
        isLoding2 = false;
      });
    } else {
      print("-=-=-=-=-=-=-${responce.statusCode}");
    }
  }

  final List favoriteItems = [];
  final List searchItems = [];
  bool isFavourite = false;
  List searchImage = [];

  trendingWallpaper() async {
    final responce = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=89"),

        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });
    isLoding1 = true;
    if (responce.statusCode == 200) {
      var jsondata = jsonDecode(responce.body);
      TrendingImage = jsondata["photos"];
      isLoding1 = false;
      setState(() {});
    } else {
      print("-=-=-=-=-=${responce.statusCode}");
    }
  }

  var i;
  List TrendingImage = [];
  TextEditingController search = TextEditingController();
  bool isLoding1 = true;
  bool isLoding2 = true;
  var searchKey = GlobalKey<FormState>();

  @override
  void initState() {
    // Timer(Duration(seconds: 3), () {
    //   setState(() {
    //     isLoding1=false;
    //   });
    // });
    trendingWallpaper();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: (isLoding1 != true)
                ? Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Form(
                          key: searchKey,
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14)),
                            child: TextFormField(
                              controller: search,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 22,
                                  color: Colors.grey,
                                ),
                                label: Text("Search"),
                                suffixIcon: (search.text.isNotEmpty)
                                    ? IconButton(
                                        onPressed: () {
                                          search.clear();
                                        },
                                        icon: Icon(
                                          CupertinoIcons.xmark,
                                          color: Colors.grey,
                                          size: 16,
                                        ),
                                      )
                                    : SizedBox(),
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                                hintText: "Search your wallpaper",
                                hintStyle: TextStyle(

                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                              ),
                              onChanged: (String value) async {
                                value = (search.text.isNotEmpty)
                                    ? await searchWallpaper(query = search.text)
                                    : "";
                                setState(() {});
                              },
                            ),
                          )),
                      const SizedBox(
                        height: 6,
                      ),
                      (search.text.isEmpty)
                          ? Container(
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Recommended",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 22),
                                  )))
                          : const SizedBox(),
                      (search.text.isEmpty)
                          ? Expanded(
                              child: GridView.builder(
                                itemCount: TrendingImage.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
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
                                            builder: (context) => DetailScreen(
                                                Image: TrendingImage[index]
                                                    ['src']['portrait']),
                                          ));
                                    },
                                    child: Container(
                                      height: 300,
                                      margin: EdgeInsets.all(10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              spreadRadius: 2,
                                              blurStyle: BlurStyle.normal,
                                              blurRadius: 12,
                                              offset: Offset(1, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xff000000),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  TrendingImage[index]['src']
                                                      ['portrait']),
                                              fit: BoxFit.cover)),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                  icon: Icon(
                                                    color: (box.read("Image") ==
                                                            null)
                                                        ? Colors.grey
                                                        : (box.read("Image").contains(
                                                                TrendingImage[
                                                                            index]
                                                                        ['src'][
                                                                    'portrait']))
                                                            ? Colors.amberAccent
                                                            : Colors.grey,
                                                    Icons.favorite,
                                                  ),
                                                  onPressed: () {
                                                    isFavourite = true;
                                                    setState(() {
                                                      if (isFavourite == true) {
                                                        favoriteItems.add(
                                                            TrendingImage[index]
                                                                    ['src']
                                                                ['portrait']);
                                                        setState(() {
                                                          (favoriteItems
                                                                  .isNotEmpty)
                                                              ? box.write(
                                                                  "Image",
                                                                  favoriteItems)
                                                              : SizedBox();
                                                          print(
                                                              "=--=-=-=-=--=-${box.read("Image")}");
                                                          print(
                                                              "ADDD-=====$favoriteItems");
                                                        });
                                                      } else if (favoriteItems
                                                          .contains(box.read(
                                                              "Image"[
                                                                  index]))) {
                                                        (box.read("Image") ==
                                                                null)
                                                            ? favoriteItems.remove(
                                                                TrendingImage[
                                                                            index]
                                                                        ['src'][
                                                                    'portrait'])
                                                            : favoriteItems.add(
                                                                TrendingImage[
                                                                            index]
                                                                        ['src'][
                                                                    'portrait']);
                                                        setState(() {
                                                          print(
                                                              "REMOVE-=====$favoriteItems");
                                                        });
                                                      } else {
                                                        favoriteItems.add(
                                                            TrendingImage[index]
                                                                    ['src']
                                                                ['portrait']);
                                                        setState(() {
                                                          (favoriteItems
                                                                  .isNotEmpty)
                                                              ? box.write(
                                                                  "Image",
                                                                  favoriteItems)
                                                              : SizedBox();
                                                          print(
                                                              "=--=-=-=-=--=-${box.read("Image")}");

                                                          print(
                                                              "ADDD-=====$favoriteItems");
                                                        });
                                                      }
                                                    });
                                                  }),
                                              SizedBox(
                                                width: 4,
                                              )
                                            ],
                                          ),
                                          (isLoding1)
                                              ? CircularProgressIndicator(
                                                  color: Colors.blue,
                                                  backgroundColor: Colors.blue,
                                                )
                                              : SizedBox()
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: GridView.builder(
                                itemCount: searchImage.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent: 400,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8,
                                        childAspectRatio: 12),
                                itemBuilder: (context, index) {
                                  return (searchImage[index]['src']['portrait']
                                          .toString()
                                          .isEmpty)
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  CupertinoIcons.xmark_shield,
                                                  color: Colors.grey,
                                                  size: 32,
                                                )),
                                            SizedBox(
                                              height: 14,
                                            ),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "No Result Found",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18),
                                                )),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "We can't find ay item matching\nyour search",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 13),
                                                )),
                                          ],
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailScreen(
                                                          Image:
                                                              searchImage[index]
                                                                      ['src']
                                                                  ['portrait']),
                                                ));
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 8, right: 8, top: 12),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              boxShadow: [
                                                BoxShadow(
                                                    blurStyle: BlurStyle.normal,
                                                    blurRadius: 2,
                                                    spreadRadius: 2,
                                                    color: Colors.black)
                                              ],
                                              backgroundBlendMode:
                                                  BlendMode.darken,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      searchImage[index]['src']
                                                          ['portrait']),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                        icon: Icon(
                                                          color: (box.read(
                                                                      "Image") ==
                                                                  null)
                                                              ? Colors.grey
                                                              : (box.read("Image").contains(
                                                                      searchImage[index]
                                                                              [
                                                                              'src']
                                                                          [
                                                                          'portrait']))
                                                                  ? Colors
                                                                      .amberAccent
                                                                  : Colors.grey,
                                                          Icons.favorite,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            if (searchItems.contains(
                                                                searchImage[index]
                                                                        ['src'][
                                                                    'portrait'])) {
                                                              searchItems.remove(
                                                                  searchImage[index]
                                                                          [
                                                                          'src']
                                                                      [
                                                                      'portrait']);
                                                              setState(() {
                                                                print(
                                                                    "REMOVE-=====$searchItems");
                                                              });
                                                            } else {
                                                              searchItems.add(
                                                                  searchImage[index]
                                                                          [
                                                                          'src']
                                                                      [
                                                                      'portrait']);
                                                              setState(() {
                                                                (searchItems
                                                                        .isNotEmpty)
                                                                    ? box.write(
                                                                        "Image",
                                                                        searchItems)
                                                                    : SizedBox();
                                                                print(
                                                                    "=--=-=-=-=--=-${box.read("Image")}");

                                                                print(
                                                                    "ADDD-=====$searchItems");
                                                              });
                                                            }
                                                          });
                                                        }),
                                                    SizedBox(
                                                      width: 4,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ));
                                },
                              ),
                            ),
                    ],
                  )
                : const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                            strokeWidth: 2,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  )),
      ),
    );
  }
}
