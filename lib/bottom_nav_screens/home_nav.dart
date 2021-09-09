import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/special_category_list_tile.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/pages/category_page.dart';
import 'package:bafdo/sub_pages/coupos_page.dart';
import 'package:bafdo/sub_pages/notifications_page.dart';
import 'package:bafdo/sub_pages/product_page.dart';
import 'package:bafdo/sub_pages/recently_views.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeNav extends StatefulWidget {
  HomeNav({Key? key}) : super(key: key);

  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();

  List<String> _general_gift_categories = [
    'Jewelry & Accessories',
    'Beauty & care',
    'Arts & Carts',
    'Home & Appliances',
    'Computers & Accessories',
    'Outdoor Sports',
    'Toys & Entertainment',
    'Personalised'
  ];

  List<String> _special_gift_categories = [
    'Anniversary',
    'Birth day',
    'Him',
    'Her',
    'Kids',
    'Wedding',
    'House warming',
    'Personalised'
  ];

  List<String> _feature_icons_list = [
    'assets/app_icon/body_icon/wedding.png',
    'assets/app_icon/body_icon/birthday.png',
    'assets/app_icon/body_icon/him.png',
    'assets/app_icon/body_icon/her.png',
    'assets/app_icon/body_icon/kids.png',
    'assets/app_icon/body_icon/anniversary.png',
    'assets/app_icon/body_icon/house_warming.png',
    'assets/app_icon/body_icon/personalized.png',
  ];
  final List<String> imgList = [
    'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
    'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
    'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
  ];
  int currentPos = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      key: _scaffoldKey,
      drawer: Drawer(),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.fromLTRB(size.width * .025, 0, 0, 0),
          child: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Image.asset(
                'assets/app_icon/app_bar_icon/menu.png',
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width * .2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/app_icon/app_bar_icon/bafdo_with_logo.png',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: size.width * .002,
                      width: size.width * .01,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.width * .01,
                      ),
                      //size == 14.91
                      child: Text(
                        'GO WITH BEST',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .018),
                      ),
                    ),
                    Container(
                      height: size.width * .002,
                      width: size.width * .01,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            width: size.width * .3,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, size.width * .045, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CouponsPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/app_icon/body_icon/cart.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .025,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => NotificationPage()));
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22,
                          child: Image.asset(
                            'assets/app_icon/app_bar_icon/notification.png',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        right: -5.0,
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width * .04,
                          height: size.width * .04,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '3',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .02),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: _bodyUI(context),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(size.width * .045, size.width * .00,
              size.width * .045, size.width * .015),
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * .03),
                  topRight: Radius.circular(size.width * .03),
                  bottomLeft: Radius.circular(size.width * .03),
                  bottomRight: Radius.circular(size.width * .03),
                )),
            child: Padding(
                padding: EdgeInsets.fromLTRB(size.width * .03, 0, 0, 0),
                child: Container(
                  width: size.width * .6,
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        hintText: 'Search product',
                        hintStyle: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                        suffixIcon: Image.asset(
                          'assets/app_icon/text_field_icon/search_icon.png',
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                    cursorColor: Color(0xff131214),
                  ),
                )),
          ),
        ),
        Container(
            padding: EdgeInsets.all(size.width * .04),
            width: size.width,
            height: size.height * .7,
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorsVariables.textColor,
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                child: Stack(
                  children: [
                    Container(
                        child: CarouselSlider.builder(
                      itemCount: imgList.length,
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPos = index;
                          });
                        },
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      itemBuilder: (context, index, realIdx) {
                        return Container(
                          child: Center(
                              child: Image.asset(imgList[index],
                                  fit: BoxFit.fill, width: size.width)),
                        );
                      },
                    )),
                    Positioned(
                      bottom: 5,
                      left: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int? dotIndex;
                          setState(() {
                            dotIndex = imgList.indexOf(url);
                          });

                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentPos == dotIndex
                                  ? Colors.white
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Positioned(
                      bottom: size.width * .05,
                      left: size.width * .1,
                      child: Container(
                          height: size.width * .12,
                          width: size.width * .3,
                          decoration: BoxDecoration(
                              color: Colors.pink.shade300,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              border:
                                  Border.all(color: Colors.white, width: .8)),
                          child: Center(
                            child: Text(
                              'Get Now',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .045),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.width * .1),
              Stack(
                overflow: Overflow.visible,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 1,
                        width: size.width,
                        color: ColorsVariables.pinkColor,
                      ),
                      GridView.builder(
                          itemCount: 8,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: size.width * 0,
                          ),
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.white,
                              padding: const EdgeInsets.all(8.0),
                              child: specialCategoryListTile(
                                  context,
                                  _special_gift_categories,
                                  _feature_icons_list,
                                  index),
                            );
                          }),
                    ],
                  ),
                  Positioned(
                      left: 30,
                      top: -30,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsVariables.pinkColor,
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(15.0),
                              topRight: const Radius.circular(15.0),
                              bottomLeft: const Radius.circular(-15.0)),
                        ),
                        child: Container(
                          margin: const EdgeInsetsDirectional.only(
                              start: 1, end: 1, top: 1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(13.0),
                              topRight: const Radius.circular(13.0),
                            ),
                          ), // Bor
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Special',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontWeight: FontWeight.w500,
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .045),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      left: 220,
                      top: -30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Up Coming',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .045),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: size.width * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      color: Colors.white,
                      width: size.width * .6,
                      padding: EdgeInsets.fromLTRB(size.width * .01, 0, 0, 0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/app_icon/body_icon/traditional_icon.png',
                          ),
                          Text(
                            'Traditional Categories',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                fontWeight: FontWeight.w500,
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .045),
                          ),
                        ],
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryPage()));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .04),
                      child: Text(
                        'See More',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return FeatureCategoryListTile();
                  },
                ),
              ),
              SizedBox(
                height: size.width * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //  crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Hand Picked',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductPage(
                                    navigateFrom: 'Hand Picked',
                                  )));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .04),
                      child: Text(
                        'See More',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return FeatureCategoryListTile();
                  },
                ),
              ),
              SizedBox(
                height: size.width * .04,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Image.asset(
                      'assets/app_icon/body_icon/flash_deal_icon.png',
                    ),
                    Text(
                      'Flash Deal',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .045),
                    ),
                    Text(
                      'Ending in',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          fontWeight: FontWeight.w500,
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04),
                    ),
                    Container(
                      height: size.width * .07,
                      width: size.width * .07,
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                          color: Colors.pink.shade300,
                          border: new Border.all(
                              width: 2.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
                          borderRadius: new BorderRadius.circular(6.97)),
                      child: TextField(
                        // inputFormatters: [
                        //   LengthLimitingTextInputFormatter(1),
                        // ],

                        controller: controller1,
                        autofocus: false,
                        enabled: false,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: '00',
                          hintStyle: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .04),
                        ),
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .06),
                      ),
                    ),
                    Text(' : '),
                    Container(
                      height: size.width * .07,
                      width: size.width * .07,
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                          color: Colors.pink.shade300,
                          border: new Border.all(
                              width: 2.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
                          borderRadius: new BorderRadius.circular(6.97)),
                      child: TextField(
                          // inputFormatters: [
                          //   LengthLimitingTextInputFormatter(1),
                          // ],
                          controller: controller2,
                          autofocus: false,
                          enabled: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '00',
                            hintStyle: TextStyle(
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .06)),
                    ),
                    Text(' : '),
                    Container(
                      height: size.width * .05,
                      width: size.width * .07,
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                          color: Colors.pink.shade300,
                          border: new Border.all(
                              width: 2.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
                          borderRadius: new BorderRadius.circular(6.97)),
                      child: Center(
                        child: TextField(
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(1),
                            // ],
                            controller: controller3,
                            autofocus: false,
                            enabled: false,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: '00',
                                hintStyle: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .03)),
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .03)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage(
                                      navigateFrom: 'Flash Deal',
                                    )));
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .04),
                        child: Text('See More',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return FeatureCategoryListTile();
                  },
                ),
              ),
              SizedBox(
                height: size.width * .04,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //  crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/app_icon/body_icon/feature_icon.png',
                          ),
                          Text('Daily Featured',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: ColorsVariables.textColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .045)),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                        navigateFrom: 'Daily Featured',
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .04),
                          child: Text('See More',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04)),
                        ),
                      ),
                    ]),
              ),
              Container(
                height: size.width * .5,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return FeatureCategoryListTile();
                  },
                ),
              ),
              SizedBox(
                height: size.width * .04,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //  crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Text('Feature  Categories',
                          style: TextStyle(
                              fontFamily: 'taviraj',
                              fontWeight: FontWeight.w500,
                              color: ColorsVariables.textColor,
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * .045)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                        navigateFrom: 'Feature  Categories',
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .04),
                          child: Text('See More',
                              style: TextStyle(
                                  fontFamily: 'taviraj',
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04)),
                        ),
                      ),
                    ]),
              ),
              Container(
                height: size.width * .8,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return getFeatureCard(context);
                  },
                ),
              ),
              SizedBox(
                height: size.width * .5,
              )
            ]))),
      ],
    );
  }
}
