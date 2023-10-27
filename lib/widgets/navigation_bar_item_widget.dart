import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavigationBarItemWidget extends StatelessWidget {
  IconData icon;
  Color iconColor;
  String text;
  Color foregroundColor;
  NavigationBarItemWidget(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.text,
      required this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(
          flex: 3,
        ),
        Icon(
          icon,
          color: iconColor,
        ),
        const Spacer(),
        Text(
          text,
          style: TextStyle(
            color: foregroundColor,
          ),
        ),
      ],
    );
  }
}
