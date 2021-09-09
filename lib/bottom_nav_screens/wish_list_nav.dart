import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/custom_widget/product_list_tile.dart';
import 'package:bafdo/custom_widget/red_folder_list_tile.dart';
import 'package:bafdo/sub_pages/product_details.dart';
import 'package:bafdo/sub_pages/wish_list_details.dart';
import 'package:flutter/material.dart';

class WishListNav extends StatefulWidget {
  const WishListNav({Key? key}) : super(key: key);

  @override
  _WishListNavState createState() => _WishListNavState();
}

class _WishListNavState extends State<WishListNav> {
  List<String> testList = [
    'Wife',
    'Eid',
    'For Children',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      appBar: AppBar(
        backgroundColor: Color(0xffEFF9F9),
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/app_icon/app_bar_icon/arrow_left.png'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Wish List',
            style: TextStyle(
                fontFamily: 'taviraj',
                fontWeight: FontWeight.bold,
                color: ColorsVariables.textColor,
                fontStyle: FontStyle.normal,
                fontSize: size.width * .06)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Image.asset('assets/app_icon/app_bar_icon/close.png'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: _bodyUI(context)),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        padding: EdgeInsets.fromLTRB(size.width * .045, size.width * .045,
            size.width * .045, size.width * .28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: size.width * .01,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Text('Your List (3)',
                  style: TextStyle(
                      fontFamily: 'taviraj',
                      fontWeight: FontWeight.w500,
                      color: ColorsVariables.textColor,
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * .04)),
            ),
            Container(
                width: size.width,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WishListDetails()));
                    },
                    child: getRedFolder(context, testList))),
            Divider(
              color: Colors.grey,
              height: size.width * .01,
            ),
            Row(
              children: [
                Text('All products',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500,
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .045)),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.edit))),
              ],
            ),
            Divider(
              color: Colors.grey,
              height: size.width * .01,
            ),
            Container(
              child: ListView.builder(
                itemCount: 3,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index != 3 - 1) {
                    return Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.width * .035,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail()));
                              },
                              child: getProductDemo(context)),
                          SizedBox(
                            height: size.width * .035,
                          ),
                          Container(
                            width: size.width,
                            child: Divider(
                              color: Color(0xffA7A6A8),
                              height: size.width * .01,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: size.width * .035,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetail()));
                          },
                          child: getProductDemo(context)),
                      SizedBox(
                        height: size.width * .06,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Text('More To Love',
                    style: TextStyle(
                        fontFamily: 'taviraj',
                        color: ColorsVariables.textColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * .045)),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Text('See More',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04))),
                )
              ],
            ),
            SizedBox(
              height: size.width * .03,
            ),
            Container(
              height: size.width * .5,
              width: size.width,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: size.width * .001,
                      mainAxisSpacing: size.width * .01,
                      childAspectRatio: .79),
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return FeatureCategoryListTile();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
