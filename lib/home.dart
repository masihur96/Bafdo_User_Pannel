import 'dart:ui';
import 'package:bafdo/bottom_nav_screens/my_bafdu_nav.dart';
import 'package:bafdo/bottom_nav_screens/festival_nav.dart';
import 'package:bafdo/bottom_nav_screens/home_nav.dart';
import 'package:bafdo/bottom_nav_screens/wish_list_nav.dart';
import 'package:bafdo/pages/add_priyo_manush_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItem = 0;
  final _tabs = [
    HomeNav(),
    FestivalPage(),
    WishListNav(),
    MaBafdo(),
    MaBafdo(),
  ];

  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: Container(
          height: size.width * 0.17,
          width: size.width * 0.17,
          child: FloatingActionButton(

              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_)=>AddPriyoManush()));}, child: Icon(Icons.add,size: size.width*.15,),
            elevation: 0.1,


          ), ),floatingActionButtonLocation:
    FloatingActionButtonLocation.centerFloat,


        backgroundColor: Color(0xffEFF9F9), body: _bodyUI(context));
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          child: PageView(
            children: _tabs,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _selectedItem = index;
              });
            },
            controller: _pageController,
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.width * .2,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.width*.2,
                    child: Image.asset(
    'assets/app_icon/bottom_nav_icon/bottom_curve.png',
    fit: BoxFit.fill,),),


                  // CustomPaint(
                  //   size: Size(size.width, size.width * .2),
                  //   painter: BNBCustomPainter(),
                  // ),

                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 5),
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedItem = 0;
                            });
                            _pageController.jumpToPage(0);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: size.width * .06,
                                width: size.width * .06,
                                child: Image.asset(
                                  'assets/app_icon/bottom_nav_icon/home.png',
                                  fit: BoxFit.fill,
                                  color: _selectedItem == 0
                                      ? Colors.pink
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04,
                                  color: _selectedItem == 0
                                      ? Colors.pink
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedItem = 1;
                            });
                            _pageController.jumpToPage(1);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: size.width * .06,
                                width: size.width * .06,
                                child: Image.asset(
                                  'assets/app_icon/body_icon/festival_grey_icon.png',
                                  fit: BoxFit.fill,
                                  color: _selectedItem == 1
                                      ? Colors.pink
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                'Festival',
                                style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04,
                                  color: _selectedItem == 1
                                      ? Colors.pink
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * .1,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedItem = 2;
                            });
                            _pageController.jumpToPage(2);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: size.width * .06,
                                width: size.width * .06,
                                child: Image.asset(
                                  'assets/app_icon/body_icon/favorite.png',
                                  fit: BoxFit.fill,
                                  color: _selectedItem == 2
                                      ? Colors.pink
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                'Wishlist',
                                style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04,
                                  color: _selectedItem == 2
                                      ? Colors.pink
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedItem = 3;
                            });
                            _pageController.jumpToPage(3);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: size.width * .06,
                                width: size.width * .06,
                                child: Image.asset(
                                  'assets/app_icon/bottom_nav_icon/profile_grey_icon.png',
                                  fit: BoxFit.fill,
                                  color: _selectedItem == 3
                                      ? Colors.pink
                                      : Colors.grey,
                                ),
                              ),
                              Text(
                                'My Bafdo',
                                style: TextStyle(
                                  fontFamily: 'taviraj',
                                  fontStyle: FontStyle.normal,
                                  fontSize: size.width * .04,
                                  color: _selectedItem == 3
                                      ? Colors.pink
                                      : Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, size.height * .7);
    path.quadraticBezierTo(size.width * .01, 0, size.width * .2, 0);
    path.quadraticBezierTo(
      size.width * 0.42,
      0,
      size.width * 0.42,
      0,
    );
    path.arcToPoint(Offset(size.width * 0.58, 30),
        radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
      size.width * 0.6,
      0,
      size.width * 0.575,
      0,
    );

    path.quadraticBezierTo(
      size.width * 0.8,
      0,
      size.width * 0.8,
      0,
    );
    path.quadraticBezierTo(
      size.width,
      0,
      size.width,
      size.height * .7,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
