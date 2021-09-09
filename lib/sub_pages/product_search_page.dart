import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/feature_category_list_tile.dart';
import 'package:bafdo/sub_pages/product_search_filtered_dialog.dart';
import 'package:flutter/material.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({Key? key}) : super(key: key);

  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  TextEditingController _searchController = TextEditingController();

  String searchValue = '';
  String navigateDetailsWidget = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEFF9F9),
        leading: IconButton(
          icon: Image.asset('assets/app_icon/app_bar_icon/arrow_left.png'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(size.width * .03),
            ),
          ),
          child: Padding(
              padding: EdgeInsets.fromLTRB(size.width * .03, 0, 0, 0),
              child: TextFormField(
                controller: _searchController,
                style: TextStyle(color: Colors.pink),
                decoration: InputDecoration(
                    focusColor: Colors.pink,
                    hintText: 'Search product',
                    hintStyle: TextStyle(
                        fontFamily: 'taviraj',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontSize: size.width * .04),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          navigateDetailsWidget = 'navigateToSearchResult';
                        });
                      },
                      child: Image.asset(
                        'assets/app_icon/text_field_icon/search_icon.png',
                        color:
                            searchValue.isNotEmpty ? Colors.pink : Colors.grey,
                      ),
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onChanged: (content) {
                  setState(() {
                    searchValue = content;
                  });
                },
                cursorColor: Color(0xff131214),
              )),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => ProductSearchFilteredDialog(),
              );
            },
            child: Image.asset(
              'assets/app_icon/app_bar_icon/filter_icon.png',
              scale: .8,
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: navigateDetailsWidget != 'navigateToSearchResult'
          ? _bodyUI(context)
          : afterSearch(context),
    );
  }

  Widget afterSearch(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int? boxColor;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      boxColor = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: boxColor == 1
                            ? Colors.pink.shade50
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 2, bottom: 2),
                      child: Text(
                        'Boi mela',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: boxColor == 1
                                ? Colors.pink
                                : ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .035),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      boxColor = 2;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: boxColor == 2
                            ? Colors.pink.shade50
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 2, bottom: 2),
                      child: Text(
                        'Controller',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: boxColor == 2
                                ? Colors.pink
                                : ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .035),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      boxColor = 3;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: boxColor == 3
                            ? Colors.pink.shade50
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 2, bottom: 2),
                      child: Text(
                        'Bijoy Mela',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: boxColor == 3
                                ? Colors.pink
                                : ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .035),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      boxColor = 4;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: boxColor == 4
                            ? Colors.pink.shade50
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 2, bottom: 2),
                      child: Text(
                        'Gaming Controller',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: boxColor == 4
                                ? Colors.pink
                                : ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .035),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Divider(
              height: 4,
              color: Colors.grey,
            ),
          ),
          Container(
            height: size.height * .83,
            child: ListView(children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Search results',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .045),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: size.width * 1.41,
                          width: size.width * .45,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return FeatureCategoryListTile();
                              }),
                        ),
                        Container(
                          height: size.width * 1.4,
                          width: size.width * .45,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return FeatureCategoryListLongTile();
                              }),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Related product',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .045),
                          ),
                          Text(
                            'See More',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .045),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: size.width * 1.4,
                          width: size.width * .45,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return FeatureCategoryListTile();
                              }),
                        ),
                        Container(
                          height: size.width * 1.4,
                          width: size.width * .45,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return FeatureCategoryListLongTile();
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .9,
      child: ListView(scrollDirection: Axis.vertical, children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                width: size.width,
                height: size.width * .4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent search',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Text(
                        'Gaming Controller',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                      Text(
                        'Bijoy Dibosh Mela',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                      Text(
                        'Mela',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                      Text(
                        'Oneplus Mobile',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                width: size.width,
                height: size.width * .3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Text(
                        'Gacher mela',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                      Text(
                        'Boishakhi Mela',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                      Text(
                        'Mela',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              child: Container(
                width: size.width,
                // height: size.width * .5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Products',
                            style: TextStyle(
                                fontFamily: 'taviraj',
                                color: ColorsVariables.textColor,
                                fontStyle: FontStyle.normal,
                                fontSize: size.width * .04),
                          )),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Container(
                        // height: size.width * .7,
                        width: size.width,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: size.width * .001,
                                    mainAxisSpacing: size.width * .01,
                                    childAspectRatio: .79),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return OfferListTile();
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
