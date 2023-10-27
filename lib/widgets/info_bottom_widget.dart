import 'package:flutter/material.dart';
import 'package:play_store_ui/models/game_info_model.dart';
import 'package:provider/provider.dart';

import '../controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class InfoBottomWidget extends StatelessWidget {
  GameInfoModel gameInfoModel;
  InfoBottomWidget({
    super.key,
    required this.gameInfoModel,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    var foregroundColor = isDark ? Colors.white : Colors.black;
    // var backgroundColor = isDark ? Colors.black : Colors.white;
    // var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var bottomForegroundColor = isDark
        ? const Color.fromARGB(255, 211, 211, 211)
        : const Color.fromARGB(255, 68, 68, 68);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              '${gameInfoModel.gRating} *',
              style: TextStyle(
                color: foregroundColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: height * 0.0095,
            ),
            Text(
              '35M reviews',
              style: TextStyle(
                color: bottomForegroundColor,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.download_for_offline_outlined,
              color: foregroundColor,
            ),
            SizedBox(
              height: height * 0.007,
            ),
            Text(
              gameInfoModel.gSize,
              style: TextStyle(
                color: bottomForegroundColor,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.rate_review_outlined,
              color: foregroundColor,
            ),
            SizedBox(
              height: height * 0.007,
            ),
            Text(
              'Rated for ${gameInfoModel.gRating.characters.characterAt(0)}+ ',
              style: TextStyle(
                color: bottomForegroundColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
