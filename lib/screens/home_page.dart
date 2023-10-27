import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:play_store_ui/screens/apps/app_page.dart';
import 'package:play_store_ui/screens/games/game_page.dart';
import 'package:play_store_ui/widgets/navigation_bar_item_widget.dart';
import 'package:provider/provider.dart';
import '../controllers/dark_mode_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    var foregroundColor = isDark ? Colors.white : Colors.black;
    var unselectedforegroundColor = isDark
        ? const Color.fromARGB(255, 211, 211, 211)
        : const Color.fromARGB(255, 46, 46, 46);
    var backgroundColor = isDark ? Colors.black : Colors.white;
    var navigationBackgroundColor = isDark
        ? const Color.fromARGB(255, 33, 33, 33)
        : const Color.fromARGB(255, 227, 227, 227);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: height * 0.065,
            width: width * 0.6,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: foregroundColor,
                ),
                suffixIcon: Icon(
                  Icons.mic_none_rounded,
                  color: foregroundColor,
                ),
                fillColor: isDark
                    ? const Color.fromARGB(255, 50, 50, 50)
                    : const Color.fromARGB(255, 205, 229, 248),
                filled: true,
                hintText: 'Search on Google-Play',
                hintStyle: TextStyle(
                  color: foregroundColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: foregroundColor,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: index,
        children: const [
          GamePage(),
          AppPage(),
          GamePage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: navigationBackgroundColor,
        selectedIndex: index,
        surfaceTintColor: const Color.fromARGB(255, 0, 234, 255),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        elevation: 0,
        height: height * 0.08,
        animationDuration: const Duration(milliseconds: 200),
        onDestinationSelected: (value) {
          setState(() {
            index = value;
          });
        },
        destinations: [
          NavigationDestination(
            icon: NavigationBarItemWidget(
              icon: FontAwesomeIcons.gamepad,
              iconColor:
                  index == 0 ? foregroundColor : unselectedforegroundColor,
              text: 'Games',
              foregroundColor:
                  index == 0 ? foregroundColor : unselectedforegroundColor,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: NavigationBarItemWidget(
              icon: FontAwesomeIcons.appStore,
              iconColor:
                  index == 1 ? foregroundColor : unselectedforegroundColor,
              text: 'Apps',
              foregroundColor:
                  index == 1 ? foregroundColor : unselectedforegroundColor,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: NavigationBarItemWidget(
              icon: FontAwesomeIcons.book,
              iconColor:
                  index == 2 ? foregroundColor : unselectedforegroundColor,
              text: 'Books',
              foregroundColor:
                  index == 2 ? foregroundColor : unselectedforegroundColor,
            ),
            label: '',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: !isDark
            ? const Color.fromARGB(255, 33, 33, 33)
            : const Color.fromARGB(255, 205, 229, 248),
        onPressed: () {
          isDark
              ? context.read<DarkModeController>().changeToLight()
              : context.read<DarkModeController>().changeToDark();
        },
        child: Icon(
          isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          color: backgroundColor,
        ),
      ),
    );
  }
}
