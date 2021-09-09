import 'package:bafdo/bottom_nav_screens/my_bafdu_nav.dart';
import 'package:bafdo/bottom_nav_screens/festival_nav.dart';

import 'package:bafdo/bottom_nav_screens/home_nav.dart';
import 'package:bafdo/bottom_nav_screens/wish_list_nav.dart';
import 'package:bafdo/pages/category_page.dart';
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
  ];

  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        bottomNavigationBar: CustomBottomNavigationBar(
          onChange: (value) {
            setState(() {
              _selectedItem = value;
              _pageController.animateToPage(_selectedItem,
                  duration: Duration(milliseconds: 100), curve: Curves.linear);
            });
          },
          defaultSelectedIndex: 0,
        ),
        body: _bodyUI(context));
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _appBarHeight = AppBar().preferredSize.height;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: PageView(
              children: _tabs,
              onPageChanged: (index) {
                _selectedItem = index;
              },
              controller: _pageController,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: _appBarHeight,
              decoration: BoxDecoration(
                  //color: Colors.white,
                  ),
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, size.height * .6),
                    painter: BNBCustomPainter(),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -size.width * .035,
            child: Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * .22,
                    height: size.height * .22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color(0xffC31A65), width: size.width * .001),
                      gradient: LinearGradient(
                          colors: [Color(0xffC31A65), Color(0xffFA4494)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.withOpacity(0.2),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: size.width * .15,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    //first 0-15%
    Path path = Path()..moveTo(0, size.height * .6);
    path.quadraticBezierTo(size.width * .06, 0, size.width * .15, 0);

    //second 15-30%
    path.lineTo(size.width * .28, 0);

    //third 30-30%
    path.quadraticBezierTo(size.width * .38, size.height * .02,
        size.width * .38, size.height * .1);

    //arc 35-65%
    path.arcToPoint(Offset(size.width * .62, size.height * .1),
        radius: Radius.circular(size.width * .15), clockwise: false);

    path.quadraticBezierTo(
        size.width * .66, size.height * .02, size.width * .75, 0);

    path.lineTo(size.width * .85, 0);

    path.quadraticBezierTo(size.width * .94, 0, size.width, size.height * .6);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  int defaultSelectedIndex = 0;
  final Function(int) onChange;
  CustomBottomNavigationBar({
    this.defaultSelectedIndex = 0,
    required this.onChange,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  double _appBarHeight = AppBar().preferredSize.height;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildBottomNavBarItem(context),
    );
  }

  Widget buildBottomNavBarItem(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: _appBarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: size.width / 2,
            height: _appBarHeight,
            alignment: Alignment.center,
            child: Container(
              width: (size.width / 2) / 1.5,
              height: _appBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      widget.onChange(0);
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Image.asset(
                          _selectedIndex == 0
                              ? 'assets/app_icon/bottom_nav_icon/home.png'
                              : 'assets/app_icon/bottom_nav_icon/home.png',
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.onChange(1);
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Image.asset(
                          'assets/app_icon/body_icon/festival_grey_icon.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: size.width / 2,
            height: _appBarHeight,
            alignment: Alignment.center,
            child: Container(
              width: (size.width / 2) / 1.5,
              height: _appBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      widget.onChange(2);
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Image.asset(
                          _selectedIndex == 2
                              ? 'assets/app_icon/body_icon/favorite.png'
                              : 'assets/app_icon/body_icon/favorite.png',
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.onChange(3);
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Image.asset(
                          _selectedIndex == 3
                              ? 'assets/app_icon/bottom_nav_icon/profile_grey_icon.png'
                              : 'assets/app_icon/bottom_nav_icon/profile_grey_icon.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
