import 'package:bafdo/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

Widget getRedFolder(BuildContext context, List<String> categoryList) {
  Size size = MediaQuery.of(context).size;
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: size.width * .02,
          childAspectRatio: .75),
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: categoryList.length + 1,
      itemBuilder: (context, index) {
        if (index == categoryList.length) {
          return Column(children: [
            SizedBox(
              height: size.width * .02,
            ),
            Container(
              height: size.width * .25,
              width: size.width * .25,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(size.width * .03),
                padding: EdgeInsets.all(6),
                child: Center(child: Icon(Icons.add, size: size.width * .12)),
              ),
            ),
          ]);
        }

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
      });
}
