import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_store_ui/controllers/dark_mode_controller.dart';
import 'package:play_store_ui/models/game_info_model.dart';
import 'package:provider/provider.dart';

import '../../widgets/info_widget.dart';

// ignore: must_be_immutable
class GameDetailPage extends StatelessWidget {
  GameInfoModel gameInfoModel;
  GameDetailPage({
    super.key,
    required this.gameInfoModel,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    var foregroundColor = isDark ? Colors.white : Colors.black;
    var backgroundColor = isDark ? Colors.black : Colors.white;
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
            ),
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          InfoWidget(gameInfoModel: gameInfoModel),
        ],
      ),
    );
  }
}
