import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_store_ui/controllers/dark_mode_controller.dart';
import 'package:play_store_ui/models/game_info_model.dart';
import 'package:play_store_ui/screens/games/game_detail_page.dart';
import 'package:play_store_ui/widgets/flat_game_widget.dart';
import 'package:play_store_ui/widgets/regular_game_widget.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> rfyNames = [
    "Asphalt 8",
    "Nitro Race",
    "Unstoppable",
    "Aventador",
    "Speed Racing",
    "Simulator",
    "Buggy Burn",
    "Runner",
    "Top racer",
    "Asphalt 4",
  ];
  List<String> rfyLIST = [
    "assets/current.png",
    "assets/aventador.png",
    "assets/nitro.png",
    "assets/current.png",
    "assets/aventador.png",
    "assets/speed.png",
    "assets/current.png",
    "assets/aventador.png",
    "assets/nitro.png",
    "assets/speed.png",
    "assets/current.png",
  ];
  List<String> rfyType = [
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
    "Racing",
  ];
  List<String> rfyRating = [
    "4.5 ",
    "4.4 ",
    "4.2 ",
    "4.5 ",
    "4.4 ",
    "4.7 ",
    "4.3 ",
    "4.5 ",
    "4.4 ",
    "4.5 ",
  ];
  List<String> rfySize = [
    "1.5 GB",
    "567 MB",
    "360 MB",
    "230 MB",
    "46 MB",
    "399 MB",
    "749 MB",
    "782 MB",
    "345 MB",
    "222 MB",
  ];
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    var foregroundColor = isDark ? Colors.white : Colors.black;
    var backgroundColor = isDark ? Colors.black : Colors.white;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showSheet(String item, String name, String rating) => showBottomSheet(
          context: context,
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          backgroundColor: isDark
              ? const Color.fromARGB(255, 33, 33, 33)
              : const Color.fromARGB(255, 227, 227, 227),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.03,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        item,
                        fit: BoxFit.fill,
                        height: height * 0.075,
                        width: 60,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 16,
                            color: foregroundColor,
                          ),
                        ),
                        Text(
                          '$rating *',
                          style: TextStyle(
                            fontSize: 14,
                            color: foregroundColor,
                          ),
                        ),
                        Text(
                          'Contains ads . in-app purchases',
                          style: TextStyle(
                            fontSize: 16,
                            color: foregroundColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Divider(
                  height: 1.5,
                  color: foregroundColor,
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.bookmark_add_outlined,
                    color: foregroundColor,
                  ),
                  title: Text(
                    'Add to wishlist',
                    style: TextStyle(
                      color: foregroundColor,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? Colors.greenAccent : Colors.green,
                    fixedSize: Size(
                      width * 0.9,
                      height * 0.05,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Text(
                    'Install',
                    style: TextStyle(
                      color: isDark ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
              ],
            );
          },
        );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        // padding: EdgeInsets.only(left: width * 0.015),
        children: [
          CarouselSlider.builder(
            // carouselController: carouselController,
            itemCount: rfyLIST.length,
            itemBuilder: ((context, index, realIndex) {
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 229, 229, 229),
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(
                      rfyLIST[index],
                    ),
                    fit: BoxFit.fill,
                    // opacity: 0.9,
                  ),
                ),
                // margin: EdgeInsets.symmetric(
                //     horizontal: width * 0.035, vertical: height * 0.045),
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.02, vertical: height * 0.015),
              );
            }),
            options: CarouselOptions(
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              height: height * 0.2,
            ),
          ),
          SizedBox(
            height: height * 0.32,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => GamesRecommend(),
                    //   ),
                    // );
                  },
                  title: Text(
                    "Recommended for you",
                    style: TextStyle(
                      color: foregroundColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.7,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: foregroundColor,
                    size: 26,
                  ),
                ),
                SizedBox(
                  height: height * 0.241,
                  width: MediaQuery.of(context).size.width - 3,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: width * 0.015),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final item = rfyLIST[index];
                      final name = rfyNames[index];
                      final type = rfyType[index];
                      final rating = rfyRating[index];
                      final size = rfySize[index];
                      return FlatGameWidget(
                        imgSrc: item,
                        iconImgSrc: item,
                        gameName: name,
                        gameType: type,
                        gameRating: rating,
                        gameSize: size,
                        onLongPress: () => showSheet(item, name, rating),
                        onPress: () => Get.to(
                          () => GameDetailPage(
                            gameInfoModel: GameInfoModel(
                              imgSrc: item,
                              gName: name,
                              gCorporation: 'SYBO games',
                              gRating: rating,
                              gSize: size,
                              gType: type,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.27,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => AppsRecommend(),
                    //   ),
                    // );
                  },
                  title: Text(
                    "Recommended for you",
                    style: TextStyle(
                      color: foregroundColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.7,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: foregroundColor,
                    size: 26,
                  ),
                ),
                SizedBox(
                  height: height * 0.18,
                  width: double.maxFinite,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: width * 0.02),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final item = rfyLIST[index];
                      final name = rfyNames[index];
                      final rating = rfyRating[index];
                      final size = rfySize[index];
                      final type = rfyType[index];
                      return RegularGameWidget(
                        imgSrc: item,
                        gameName: name,
                        gameRating: rating,
                        onLongPress: () => showSheet(item, name, rating),
                        onPress: () => Get.to(
                          () => GameDetailPage(
                            gameInfoModel: GameInfoModel(
                              imgSrc: item,
                              gName: name,
                              gCorporation: 'SYBO games',
                              gRating: rating,
                              gSize: size,
                              gType: type,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider.builder(
            // carouselController: carouselController,
            itemCount: rfyLIST.length,
            itemBuilder: ((context, index, realIndex) {
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 229, 229, 229),
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(
                      rfyLIST[index],
                    ),
                    fit: BoxFit.fill,
                    // opacity: 0.9,
                  ),
                ),
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.02, vertical: height * 0.015),
              );
            }),
            options: CarouselOptions(
              autoPlay: true,
              scrollDirection: Axis.horizontal,
              height: height * 0.2,
            ),
          ),
          SizedBox(
            height: height * 0.27,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => AppsRecommend(),
                    //   ),
                    // );
                  },
                  title: Text(
                    "Recommended for you",
                    style: TextStyle(
                      color: foregroundColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.7,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: foregroundColor,
                    size: 26,
                  ),
                ),
                SizedBox(
                  height: height * 0.18,
                  width: double.maxFinite,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: width * 0.02),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final item = rfyLIST[index];
                      final name = rfyNames[index];
                      final rating = rfyRating[index];
                      final size = rfySize[index];
                      final type = rfyType[index];
                      return RegularGameWidget(
                        imgSrc: item,
                        gameName: name,
                        gameRating: rating,
                        onLongPress: () => showSheet(item, name, rating),
                        onPress: () => Get.to(
                          () => GameDetailPage(
                            gameInfoModel: GameInfoModel(
                              imgSrc: item,
                              gName: name,
                              gCorporation: 'SYBO games',
                              gRating: rating,
                              gSize: size,
                              gType: type,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.27,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => AppsRecommend(),
                    //   ),
                    // );
                  },
                  title: Text(
                    "Recommended for you",
                    style: TextStyle(
                      color: foregroundColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.7,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: foregroundColor,
                    size: 26,
                  ),
                ),
                SizedBox(
                  height: height * 0.18,
                  width: double.maxFinite,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: width * 0.02),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final item = rfyLIST[index];
                      final name = rfyNames[index];
                      final rating = rfyRating[index];
                      final size = rfySize[index];
                      final type = rfyType[index];
                      return RegularGameWidget(
                        imgSrc: item,
                        gameName: name,
                        gameRating: rating,
                        onLongPress: () => showSheet(item, name, rating),
                        onPress: () => Get.to(
                          () => GameDetailPage(
                            gameInfoModel: GameInfoModel(
                              imgSrc: item,
                              gName: name,
                              gCorporation: 'SYBO games',
                              gRating: rating,
                              gSize: size,
                              gType: type,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.32,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => GamesRecommend(),
                    //   ),
                    // );
                  },
                  title: Text(
                    "Recommended for you",
                    style: TextStyle(
                      color: foregroundColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.7,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: foregroundColor,
                    size: 26,
                  ),
                ),
                SizedBox(
                  height: height * 0.241,
                  width: MediaQuery.of(context).size.width - 3,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: width * 0.015),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final item = rfyLIST[index];
                      final name = rfyNames[index];
                      final type = rfyType[index];
                      final rating = rfyRating[index];
                      final size = rfySize[index];
                      return FlatGameWidget(
                        imgSrc: item,
                        iconImgSrc: item,
                        gameName: name,
                        gameType: type,
                        gameRating: rating,
                        gameSize: size,
                        onLongPress: () => showSheet(item, name, rating),
                        onPress: () => Get.to(
                          () => GameDetailPage(
                            gameInfoModel: GameInfoModel(
                              imgSrc: item,
                              gName: name,
                              gCorporation: 'SYBO games',
                              gRating: rating,
                              gSize: size,
                              gType: type,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
