import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_store_ui/models/game_info_model.dart';
import 'package:play_store_ui/screens/games/game_detail_page.dart';
import 'package:play_store_ui/widgets/apps_event_widget.dart';
import 'package:play_store_ui/widgets/regular_game_widget.dart';
import 'package:provider/provider.dart';
import '../../controllers/dark_mode_controller.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  List<String> rfyNames = [
    "Google",
    "Zoom",
    "Facebook",
    "Instagram",
    "G Drive",
    "WhatsApp",
    "Discord",
    "Linked-In",
    "Pinterest",
    "Snapchat",
  ];
  List<String> rfyLIST = [
    "assets/google.png",
    "assets/zoom.png",
    "assets/ficon.png",
    "assets/iicon.png",
    "assets/gdrive.png",
    "assets/wicon.png",
    "assets/discord.png",
    "assets/linkedin.png",
    "assets/pinterest.png",
    "assets/snapchat.png",
  ];
  List<String> rfyRating = [
    "4.2 ",
    "4.5 ",
    "4.4 ",
    "4.7 ",
    "4.3 ",
    "4.5 ",
    "4.4 ",
    "4.5 ",
    "4.4 ",
    "4.5 ",
  ];
  List<String> foregroundTitles = [
    'Open your FREE\nDemat account now',
    'Flat 50Rs\nWelcome bonus',
    '40% off Canva Pro\nfor 3 months',
  ];
  List<String> backGrounds = [
    'https://wp-asset.groww.in/wp-content/uploads/2021/05/25133126/How-To-Use-Moving-Average-in-Trading_MAy-23.png',
    'https://media.istockphoto.com/id/1264890289/vector/financial-arrow-graphs.jpg?s=612x612&w=0&k=20&c=AxF8gDMkk9wz-zKHpPq8fIsgXfpPtwYjUELC1LOntTc=',
    'https://cdn.nerdschalk.com/wp-content/uploads/2022/02/canva-logo.png',
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
        children: [
          CarouselSlider.builder(
              itemCount: backGrounds.length,
              itemBuilder: ((context, index, realIndex) {
                return Container(
                  padding: EdgeInsets.only(
                    bottom: height * 0.02,
                    left: width * 0.035,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.015,
                  ),
                  // margin: EdgeInsets.symmetric(
                  //   horizontal: width * 0.035,
                  //   vertical: height * 0.04,
                  // ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                        backGrounds[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    foregroundTitles[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                );
              }),
              options: CarouselOptions(
                autoPlay: true,
                scrollDirection: Axis.horizontal,
                height: height * 0.2,
              )),
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
                              gCorporation: 'Meta',
                              gRating: rating,
                              gSize: '47 MB',
                              gType: 'Social',
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
          AppsEventWidget(
            src:
                'https://play-lh.googleusercontent.com/aTgKh70bgIYCMvMdkcsDVNYi0XAnNPd0JXEu5pO20z1m2HhWiiIMX_ulwsCFK3F24d0',
            srcBack:
                'https://media.istockphoto.com/id/1264890289/vector/financial-arrow-graphs.jpg?s=612x612&w=0&k=20&c=AxF8gDMkk9wz-zKHpPq8fIsgXfpPtwYjUELC1LOntTc=',
            appName: 'INDmoney : Stocks ,Damat & MFs',
            appDescription:
                'INDmoney : Stocks,Mutual Funds,\nSIP,FD in one App',
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
                      return RegularGameWidget(
                        imgSrc: item,
                        gameName: name,
                        gameRating: rating,
                        onLongPress: () => showSheet(item, name, rating),
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
                      return RegularGameWidget(
                        imgSrc: item,
                        gameName: name,
                        gameRating: rating,
                        onLongPress: () => showSheet(item, name, rating),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          AppsEventWidget(
            src:
                'https://play-lh.googleusercontent.com/7q2dwnqAFr91NBSBRGcE1tZQCJL-FYbUKEuy103bTmQowLl3yNY73ozy5cf1mso4pCS4',
            srcBack:
                'https://wp-asset.groww.in/wp-content/uploads/2021/05/25133126/How-To-Use-Moving-Average-in-Trading_MAy-23.png',
            appName: 'Growww: Stocks & Mutual Find',
            appDescription: 'Groww - Stock Trading ,Demat \n,Mutual Funds, SIP',
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
                      return RegularGameWidget(
                        imgSrc: item,
                        gameName: name,
                        gameRating: rating,
                        onLongPress: () => showSheet(item, name, rating),
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
