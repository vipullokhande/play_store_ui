import 'package:flutter/material.dart';
import 'package:play_store_ui/controllers/dark_mode_controller.dart';
import 'package:play_store_ui/models/game_info_model.dart';
import 'package:play_store_ui/widgets/info_bottom_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class InfoWidget extends StatelessWidget {
  GameInfoModel gameInfoModel;
  InfoWidget({super.key, required this.gameInfoModel});

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    var foregroundColor = isDark ? Colors.white : Colors.black;
    // var backgroundColor = isDark ? Colors.black : Colors.white;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.075,
            vertical: height * 0.02,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      gameInfoModel.imgSrc,
                      height: height * 0.09,
                      width: width * 0.18,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gameInfoModel.gName,
                        style: TextStyle(
                          color: foregroundColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        gameInfoModel.gCorporation,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 13, 95, 55),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Contains ads . in-app purchases',
                        style: TextStyle(
                          color: isDark
                              ? const Color.fromARGB(255, 211, 211, 211)
                              : const Color.fromARGB(255, 68, 68, 68),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.025,
              ),
              InfoBottomWidget(
                gameInfoModel: gameInfoModel,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(
                    width * 0.9,
                    height * 0.05,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Install',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.07,
          ),
          child: Text(
            '''Similar app available\n${gameInfoModel.gName} Lite (2.3 MB)''',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: foregroundColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
