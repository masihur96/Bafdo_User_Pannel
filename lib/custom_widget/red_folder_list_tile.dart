import 'package:bafdo/colors.dart';

import 'package:flutter/material.dart';

Widget getRedFolder(
    BuildContext context, List<String> categoryList, int index) {
  Size size = MediaQuery.of(context).size;
  return Column(
    children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width * .03),
        ),
        child: Container(
          width: size.width * .3,
          height: size.width * .28,
          child: Image.asset(
            'assets/app_icon/body_icon/folder.png',
          ),
        ),
      ),
      Text(
        '${categoryList[index]}',
        style: TextStyle(
            fontFamily: 'taviraj',
            color: ColorsVariables.textColor,
            fontStyle: FontStyle.normal,
            fontSize: size.width * .04),
      )
    ],
  );
}
