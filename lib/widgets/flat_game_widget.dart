import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class FlatGameWidget extends StatelessWidget {
  String imgSrc;
  String iconImgSrc;
  String gameName;
  String gameType;
  String gameRating;
  String gameSize;
  VoidCallback? onLongPress;
  VoidCallback? onPress;
  FlatGameWidget({
    Key? key,
    required this.imgSrc,
    required this.iconImgSrc,
    required this.gameName,
    required this.gameType,
    required this.gameRating,
    required this.gameSize,
    this.onLongPress,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    var foregroundColor = isDark ? Colors.white : Colors.black;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onPress,
      child: Container(
        width: width * 0.6,
        padding: EdgeInsets.only(
          left: width * 0.037,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                imgSrc,
                height: height * 0.15,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            Row(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    iconImgSrc,
                    height: height * 0.065,
                    width: width * 0.15,
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      gameName,
                      maxLines: 1,
                      style: TextStyle(
                        color: foregroundColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    // RichText(text: text)
                    Text(
                      gameType,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 103, 103, 103),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          gameRating,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 103, 103, 103),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          gameSize,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 103, 103, 103),
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(
                  flex: 4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
