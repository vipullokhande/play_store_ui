import 'package:flutter/material.dart';
import 'package:play_store_ui/controllers/dark_mode_controller.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RegularGameWidget extends StatelessWidget {
  String imgSrc;
  String gameName;
  String gameRating;
  VoidCallback? onLongPress;
  VoidCallback? onPress;
  RegularGameWidget({
    super.key,
    required this.imgSrc,
    required this.gameName,
    required this.gameRating,
    this.onLongPress,
    this.onPress,
  });

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
        width: width * 0.3,
        padding: EdgeInsets.only(
          left: width * 0.035,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Colors.grey.shade400,
                  width: 0.3,
                ),
              ),
              child: Image.asset(
                imgSrc,
                height: height * 0.115,
                width: width * 0.25,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: height * 0.007,
            ),
            Text(
              gameName,
              maxLines: 1,
              style: TextStyle(
                color: foregroundColor,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              gameRating,
              style: const TextStyle(
                color: Color.fromARGB(255, 103, 103, 103),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
