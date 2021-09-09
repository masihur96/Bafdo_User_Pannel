import 'package:bafdo/colors.dart';
import 'package:flutter/material.dart';

Widget specialCategoryListTile(BuildContext context,
    List<String> giftCategories, List<String> iconList, int index) {
  Size size = MediaQuery.of(context).size;

  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
            color: ColorsVariables.pinkColor,
            borderRadius: BorderRadius.all(Radius.circular(size.width * .04)),
            border: Border.all(width: 1, color: Colors.pink)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            //   border: Border.all(color: Colors.pink)
          ),
          child: Image.asset(
            '${iconList[index]}',
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(
        height: size.width * .01,
      ),
      Flexible(
        child: Container(
            width: size.width * .3,
            child: Text(
              '${giftCategories[index]}',
              style: TextStyle(
                  fontFamily: 'poppins',
                  color: Colors.grey,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .03),
              textAlign: TextAlign.center,
            )),
      )
    ],
  );
}
