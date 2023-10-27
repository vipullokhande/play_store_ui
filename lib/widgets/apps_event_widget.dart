import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppsEventWidget extends StatelessWidget {
  String src;
  String srcBack;
  String appName;
  String appDescription;
  AppsEventWidget({
    super.key,
    required this.src,
    required this.srcBack,
    required this.appName,
    required this.appDescription,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.3,
      width: width,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.only(right: width * 0.03, bottom: height * 0.01),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.060,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: NetworkImage(
            srcBack,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                height: height * 0.055,
                width: width * 0.1,
                margin:
                    EdgeInsets.only(left: width * 0.02, right: width * 0.03),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      src,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appName,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    appDescription,
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Color.fromARGB(224, 255, 255, 255),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    fixedSize: Size(width * 0.025, height * 0.025),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text(
                  'Install',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
