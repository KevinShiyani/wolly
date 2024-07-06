import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Screens/DetailScreen.dart';
import 'HomeView.dart';

class CatagoryView extends StatefulWidget {
  const CatagoryView({super.key});

  @override
  State<CatagoryView> createState() => _CatagoryViewState();
}

class _CatagoryViewState extends State<CatagoryView> {
  bool isIos = false;
  final List catagaryItems = [];
  bool isDesk = false;
  bool isLoad = true;
  bool isSelectCatagory = false;
  String query1 = "bikes";
  String query2 = "Nature";
  String query3 = "Street";
  String query4 = "Temple";
  String query5 = "Cars";
  String query6 = "Galaxy Wallpaper";
  String query7 = "flower Wallpaper";
  String query8 = "desktop Wallpaper";
  String query9 = "Dark Wallpaper";
  String query10 = "Love Couple Wallpaper";
  List Android = [
    "https://i.pinimg.com/236x/d4/cb/87/d4cb87e93049e3956b156a32f988003e.jpg",
    "https://i.pinimg.com/236x/94/e5/bc/94e5bc727dd713d8acb3cae6ed248a32.jpg",
    "https://i.pinimg.com/236x/ac/e2/e0/ace2e0c771c90e7a2b5ff53b9b59693f.jpg",
    "https://i.pinimg.com/236x/99/05/95/990595c2a333c77130eddedeea919ecd.jpg",
    "https://i.pinimg.com/236x/a4/f7/42/a4f7424d7becfea530f8e00a0df27a9c.jpg",
    "https://i.pinimg.com/236x/89/dd/6e/89dd6e2b30a8ba1b6b99f759ca335edf.jpg",
    "https://i.pinimg.com/236x/47/32/12/473212e8f33b3d4923caf6abe4c091f3.jpg",
    "https://i.pinimg.com/236x/c2/57/7b/c2577b24c65ac6adc7c948bfeecb16a9.jpg",
    "https://i.pinimg.com/236x/9c/10/66/9c1066fc130a9236653b571c5d181e1f.jpg",
    "https://i.pinimg.com/236x/3d/ff/4a/3dff4aba045394d2967392ce119d83c4.jpg",
    "https://i.pinimg.com/236x/e7/06/21/e706212068ebf728d0134957a049ccef.jpg",
    "https://i.pinimg.com/564x/5c/04/9a/5c049a244bc7cdf34f05f63d4f7328d5.jpg",
    "https://i.pinimg.com/236x/85/13/2b/85132b6c284f0d1442fa4d647f8f3fcb.jpg",
    "https://i.pinimg.com/474x/da/5b/75/da5b75c77976b6e373b74cbb7704fa8f.jpg",
    "https://i.pinimg.com/236x/3c/5e/a4/3c5ea4e94cf2e76be0d6da4b410fb8b2.jpg",
    "https://i.pinimg.com/236x/82/5f/b0/825fb0f88f558dfc236f770b73c03f88.jpg",
    "https://i.pinimg.com/236x/8e/e1/dd/8ee1dd5c57373a4d3c131077a4505e93.jpg",
    "https://i.pinimg.com/236x/0e/0e/b3/0e0eb3f5e03fd29d0b9b080a199c90ad.jpg",
    "https://i.pinimg.com/236x/cd/bb/23/cdbb239dcdf59d34577eb5c82de806d2.jpg",
    "https://i.pinimg.com/236x/50/58/22/50582215ae99fcf9f865d3a640367574.jpg",
    "https://i.pinimg.com/236x/50/19/70/50197081d2d105ec9fa8b62d20dd5862.jpg",
    "https://i.pinimg.com/564x/b1/32/e9/b132e9408af277a09f61dd49a1c1eb44.jpg",
    "https://i.pinimg.com/236x/6e/b4/48/6eb448d863c12209ca238de6d2a6fc8f.jpg",
    "https://i.pinimg.com/236x/8b/c0/83/8bc0831537c86aceda0369ef6ee04ad2.jpg",
    "https://i.pinimg.com/236x/e1/c6/22/e1c62260a303049cd9bce942b46c3d40.jpg",
    "https://i.pinimg.com/236x/cb/65/0b/cb650ba1204c64d8fc950752ae4d7c79.jpg",
    "https://i.pinimg.com/236x/ff/39/17/ff39177b9d48faffae852a3c682aece0.jpg",
    "https://i.pinimg.com/236x/3c/36/1c/3c361cfca21bce953f58ddb97c15f868.jpg",
    "https://i.pinimg.com/236x/63/9f/b7/639fb7b62650a5d7c52ac6ed3877f69a.jpg",
    "https://i.pinimg.com/236x/ba/66/33/ba66333444760d63056b7ef7095a7a07.jpg",
    "https://i.pinimg.com/474x/87/b9/20/87b920c973f96de22808b6032e205c1c.jpg",
    "https://i.pinimg.com/236x/19/42/fc/1942fcd525942c4d9fafa7ce6965bc92.jpg",
    "https://i.pinimg.com/236x/1b/ec/1e/1bec1ef52102c13bf4ac98868ea1d690.jpg",
    "https://i.pinimg.com/236x/d8/a0/3b/d8a03bd2425b67f4e153584f8ad982ab.jpg",
    "https://i.pinimg.com/474x/77/4e/fe/774efe133c17f8628128d6e0376ffc7e.jpg",
    "https://i.pinimg.com/236x/df/a8/9a/dfa89aad1f48b269825bc27277c6c367.jpg",
    "https://i.pinimg.com/236x/8d/cb/dc/8dcbdceadd6f026229fe0111ffe1c8b9.jpg",
    "https://i.pinimg.com/236x/ea/a3/f2/eaa3f2c228a0123b1f67d056e7f0f6a1.jpg",
    "https://i.pinimg.com/236x/99/24/8d/99248d4efe59ca5c9fd2f68866efc601.jpg",
    "https://i.pinimg.com/474x/a0/b9/50/a0b95049ff53fef8df9235b5889b7e4d.jpg",
    "https://i.pinimg.com/236x/7c/4e/9b/7c4e9b41e1aa94159009dbdbf04ea780.jpg",
    "https://i.pinimg.com/236x/09/88/d7/0988d7aa7535ccea70e139c0aa1c2058.jpg",
    "https://i.pinimg.com/236x/05/7a/1f/057a1f70491038fac2fbef469b299e46.jpg",
    "https://i.pinimg.com/236x/e3/9a/85/e39a853019b5396c9b2789b8fc2ddd35.jpg",
    "https://i.pinimg.com/236x/5f/19/90/5f1990581f2338ff545a5a11ce9321fc.jpg",
  ];
  List Ios = [
    "https://i.pinimg.com/236x/07/b0/29/07b02916152e50c20e97f9b72a357a32.jpg",
    "https://i.pinimg.com/236x/08/70/6f/08706f63b134b4510b701daee7191552.jpg",
    "https://i.pinimg.com/236x/b8/60/51/b860514c814282cabdeedf2dfeb75659.jpg",
    "https://i.pinimg.com/236x/c1/48/81/c148812f7d6a861b8e0e80f0a711dfb6.jpg",
    "https://i.pinimg.com/236x/dd/6e/5a/dd6e5a04a6bc5556c336b930cbfbba3f.jpg",
    "https://i.pinimg.com/236x/3e/a3/93/3ea393031d1fced726cadd83022a59d7.jpg",
    "https://i.pinimg.com/236x/87/68/c6/8768c6b6e453737e472dc8a3d33e26b6.jpg",
    "https://i.pinimg.com/236x/91/5b/6e/915b6e963628dbd24d4628275d4c1676.jpg",
    "https://i.pinimg.com/236x/15/88/76/1588769a2eee6252e17a6aac95ef0215.jpg",
    "https://i.pinimg.com/236x/eb/0e/8b/eb0e8b947ff9f134f004a2c1c639fa2d.jpg",
    "https://i.pinimg.com/236x/84/c4/31/84c4310291f6de45403abeb3849e0ef8.jpg",
    "https://i.pinimg.com/236x/eb/0e/8b/eb0e8b947ff9f134f004a2c1c639fa2d.jpg",
    "https://i.pinimg.com/236x/34/92/3c/34923cbe10335b4936b2b82bada2b0ea.jpg",
    "https://i.pinimg.com/236x/61/60/69/6160690abf99d0fcba58768f0fd894da.jpg",
    "https://i.pinimg.com/564x/68/7c/86/687c865d2e0120556957a89670c777c6.jpg",
    "https://i.pinimg.com/236x/10/17/04/101704622e01891922da431bd65b8820.jpg",
    "https://i.pinimg.com/236x/c3/7f/84/c37f849df42991b99aca18293349eb7e.jpg",
    "https://i.pinimg.com/236x/6f/93/12/6f93122f50bf4831bd2e1b10c6114182.jpg",
    "https://i.pinimg.com/236x/bd/f0/a6/bdf0a666fb4035569e7e5977ba01cbcc.jpg",
    "https://i.pinimg.com/236x/84/00/74/8400747197e0a462e380e46fbeeb2462.jpg",
    "https://i.pinimg.com/236x/c3/d4/ee/c3d4eed8c410e134ec34be1062f43ab7.jpg",
    "https://i.pinimg.com/236x/a5/3c/84/a53c8451143a06e62980ac2ce922552e.jpg",
    "https://i.pinimg.com/236x/06/52/f2/0652f22babea816e428c7c06ada5a4dd.jpg",
    "https://i.pinimg.com/236x/eb/0e/d4/eb0ed460a216439a3778cbffc42532f0.jpg",
    "https://i.pinimg.com/236x/78/50/a3/7850a350ad87e7d45aee07833401f879.jpg",
    "https://i.pinimg.com/474x/20/ac/0b/20ac0bee32295df5db6af4cab08ef0cb.jpg",
    "https://i.pinimg.com/474x/23/4d/75/234d75450e55ce418f6582b79def79c8.jpg",
    "https://i.pinimg.com/236x/2d/11/45/2d114567939fe7699ff488ad8495caa4.jpg",
    "https://i.pinimg.com/236x/e1/d0/2c/e1d02c59828853b393f7946a17862b2c.jpg",
    "https://i.pinimg.com/236x/02/65/fe/0265fe6e613f8f27832a62d5be8f203c.jpg",
    "https://i.pinimg.com/236x/ae/0d/6f/ae0d6ff1481505ae24f1901121242b27.jpg",
    "https://i.pinimg.com/236x/50/f8/84/50f8846b81dc8a0f51cdd5284b304e8b.jpg",
  ];
  List catagoryText = [
    "Bikes Wallpaper",
    "Nature Wallpaper",
    "Street Wallpaper",
    "Temple Wallpaper",
    "Cars Wallpaper",
    "Galaxy Wallpaper",
    "Flower Wallpaper",
    "Desktop Wallpaper",
    "Dark Wallpaper",
    "Love Wallpaper",
  ];
  List catagoryImageDp = [
    "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/620337/pexels-photo-620337.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/161401/fushimi-inari-taisha-shrine-kyoto-japan-temple-161401.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/516541/pexels-photo-516541.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/50594/sea-bay-waterfront-beach-50594.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/2387793/pexels-photo-2387793.jpeg?auto=compress&cs=tinysrgb&w=600",
    "https://images.pexels.com/photos/206557/pexels-photo-206557.jpeg?auto=compress&cs=tinysrgb&w=600"
  ];
  List catagoryApi = [];

  Catagarywallpaper1() async {
    final responce = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query1&per_page=990"),
        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });
    if (responce.statusCode == 200) {
      //print(responce.body);
      var data = jsonDecode(responce.body);
      catagoryApi = data['photos'];
      print(catagoryApi);
      setState(() {
        isLoad = false;
      });
    } else {
      print("0-=-=-=-=-=${responce.statusCode}");
    }
  }

  Catagarywallpaper2() async {
    final responce = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query2&per_page=40"),
        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });
    if (responce.statusCode == 200) {
      //print(responce.body);
      var data = jsonDecode(responce.body);
      catagoryApi = data['photos'];
      print(catagoryApi);
      setState(() {
        isLoad = false;
      });
    } else {
      print("0-=-=-=-=-=${responce.statusCode}");
    }
  }

  Catagarywallpaper3() async {
    final responce = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query3&per_page=40"),
        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });
    if (responce.statusCode == 200) {
      //print(responce.body);
      var data = jsonDecode(responce.body);
      catagoryApi = data['photos'];
      print(catagoryApi);
      isLoad = false;
      setState(() {});
    } else {
      print("0-=-=-=-=-=${responce.statusCode}");
    }
  }

  Catagarywallpaper4() async {
    final responce = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query4&per_page=40"),
        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });
    if (responce.statusCode == 200) {
      //print(responce.body);
      var data = jsonDecode(responce.body);
      catagoryApi = data['photos'];
      print(catagoryApi);
      isLoad = false;
      setState(() {});
    } else {
      print("0-=-=-=-=-=${responce.statusCode}");
    }
  }

  Catagarywallpaper5() async {
    final responce = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query5&per_page=40"),
        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });
    if (responce.statusCode == 200) {
      //print(responce.body);
      var data = jsonDecode(responce.body);
      catagoryApi = data['photos'];
      print(catagoryApi);
      isLoad = false;
      setState(() {});
    } else {
      print("0-=-=-=-=-=${responce.statusCode}");
    }
  }

  Catagarywallpaper6() async {
    final responce = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query6&per_page=40"),
        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });
    if (responce.statusCode == 200) {
      //print(responce.body);
      var data = jsonDecode(responce.body);
      catagoryApi = data['photos'];
      print(catagoryApi);
      isLoad = false;
      setState(() {});
    } else {
      print("-=-=-=-=-=${responce.statusCode}");
    }
  }

  Catagarywallpaper7() async {
    final responce = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query7&per_page=40"),
        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });
    if (responce.statusCode == 200) {
      //print(responce.body);
      var data = jsonDecode(responce.body);
      catagoryApi = data['photos'];
      print(catagoryApi);
      isLoad = false;
      setState(() {});
    } else {
      print("0-=-=-=-=-=${responce.statusCode}");
    }
  }

  Catagarywallpaper8() async {
    final responce = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query8&per_page=40"),
        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });
    if (responce.statusCode == 200) {
      //print(responce.body);
      var data = jsonDecode(responce.body);
      catagoryApi = data['photos'];
      print(catagoryApi);
      isDesk = true;
      isLoad = false;
      setState(() {});
    } else {
      print("0-=-=-=-=-=${responce.statusCode}");
    }
  }

  Catagarywallpaper9() async {
    final responce = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query9&per_page=40"),
        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });
    if (responce.statusCode == 200) {
      //print(responce.body);
      var data = jsonDecode(responce.body);
      catagoryApi = data['photos'];
      print(catagoryApi);
      isLoad = false;
      setState(() {});
    } else {
      print("0-=-=-=-=-=${responce.statusCode}");
    }
  }

  Catagarywallpaper10() async {
    final responce = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query10&per_page=40"),
        headers: {
          "Authorization":
              "UbCUkjniomPdg29O6muEHEVITMsloUXQSvEYrrsvrPACNZ6Cij8vqAG0",
        });
    if (responce.statusCode == 200) {
      //print(responce.body);
      var data = jsonDecode(responce.body);
      catagoryApi = data['photos'];
      print(catagoryApi);
      isLoad = false;
      setState(() {});
    } else {
      print("0-=-=-=-=-=${responce.statusCode}");
    }
  }

  void _handleRefreshTap() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: (isSelectCatagory == true)
          ? AppBar(
              backgroundColor: Color(0xff202020),
              leading: IconButton(
                  onPressed: _handleRefreshTap,
                  icon: Icon(
                    CupertinoIcons.back,
                    size: 26,
                    color: Colors.white,
                  )),
            )
          : null,
      body: SafeArea(
          child:Column(
        children: [
          (isSelectCatagory == true)
              ? (isLoad == true)
                  ? Expanded(
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      ],
                    ))
                  : Expanded(
                      child: GridView.builder(
                        itemCount: catagoryApi.length,
                        physics: BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.normal,
                            parent: BouncingScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: (isDesk == true) ? 1 : 2,
                            mainAxisExtent: (isDesk == true) ? 500 : 400,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 12),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                          Image: catagoryApi[index]['src']
                                              ['portrait']),
                                    ));
                              },
                              child: (catagoryApi[index]['src']['portrait'] !=
                                      null)
                                  ? Container(
                                      width: (isDesk == true) ? 200 : 0,
                                      margin: EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 16,
                                          bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        boxShadow: [
                                          BoxShadow(
                                              blurStyle: BlurStyle.normal,
                                              offset: Offset(1, 2),
                                              blurRadius: 6,
                                              spreadRadius: 6,
                                              color: Colors.black)
                                        ],
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                catagoryApi[index]['src']
                                                    ['portrait']),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children: [
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
                                                                catagoryApi[index]
                                                                        ['src'][
                                                                    'portrait']))
                                                            ? Colors.amberAccent
                                                            : Colors.grey,
                                                    Icons.favorite,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      if (catagaryItems
                                                          .contains(catagoryApi[
                                                                  index]['src']
                                                              ['portrait'])) {
                                                        catagaryItems.remove(
                                                            catagoryApi[index]
                                                                    ['src']
                                                                ['portrait']);
                                                        setState(() {
                                                          print(
                                                              "REMOVE-=====$catagaryItems");
                                                        });
                                                      } else {
                                                        catagaryItems.add(
                                                            catagoryApi[index]
                                                                    ['src']
                                                                ['portrait']);
                                                        setState(() {
                                                          (catagaryItems
                                                                  .isNotEmpty)
                                                              ? box.write(
                                                                  "Image",
                                                                  catagaryItems)
                                                              : SizedBox();
                                                          print(
                                                              "=--=-=-=-=--=-${box.read("Image")}");

                                                          print(
                                                              "ADDD-=====$catagaryItems");
                                                        });
                                                      }
                                                    });
                                                  })
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.grey,
                                      strokeWidth: 2,
                                    )));
                        },
                      ),
                    )
              : Expanded(
                  child: ListView.builder(
                    itemCount: catagoryImageDp.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          catagoryText[index] == "Bikes Wallpaper"
                              ? Catagarywallpaper1()
                              : catagoryText[index] == "Nature Wallpaper"
                                  ? Catagarywallpaper2()
                                  : catagoryText[index] == "Street Wallpaper"
                                      ? Catagarywallpaper3()
                                      : catagoryText[index] ==
                                              "Temple Wallpaper"
                                          ? Catagarywallpaper4()
                                          : catagoryText[index] ==
                                                  "Cars Wallpaper"
                                              ? Catagarywallpaper5()
                                              : (catagoryText[index] ==
                                                      "Galaxy Wallpaper")
                                                  ? Catagarywallpaper6()
                                                  : (catagoryText[index] ==
                                                          "Flower Wallpaper")
                                                      ? Catagarywallpaper7()
                                                      : (catagoryText[index] ==
                                                              "Desktop Wallpaper")
                                                          ? Catagarywallpaper8()
                                                          : (catagoryText[
                                                                      index] ==
                                                                  "Dark Wallpaper")
                                                              ? Catagarywallpaper9()
                                                              : (catagoryText[
                                                                          index] ==
                                                                      "Love Wallpaper")
                                                                  ? Catagarywallpaper10()
                                                                  : SizedBox();
                          setState(() {
                            isSelectCatagory = !isSelectCatagory;
                          });
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(catagoryImageDp[index]),
                                  fit: BoxFit.cover)),
                          child: Text(
                            catagoryText[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      )),
    );
  }
}
