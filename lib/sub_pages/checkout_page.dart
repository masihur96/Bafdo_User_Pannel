import 'package:bafdo/colors.dart';
import 'package:bafdo/custom_widget/custom_appbar.dart';

import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String paymentItem = 'nogot';

  List selectIndex = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffEFF9F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:
                  Image.asset('assets/app_icon/app_bar_icon/arrow_left.png')),
          title: Text('Checkout',
              style: TextStyle(
                  fontFamily: 'taviraj',
                  color: ColorsVariables.textColor,
                  fontStyle: FontStyle.normal,
                  fontSize: size.width * .04)),
          trailing1: InkWell(
              onTap: () {},
              child: Image.asset('assets/app_icon/app_bar_icon/close.png')),
          trailing2: Container(),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping to',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04)),
                    Image.asset(
                        'assets/app_icon/body_icon/drop_circuler_add.png')
                  ],
                ),
              ),
              Container(
                height: size.width * .6,
                width: size.width,
                child: ListView.builder(
                  // scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _checkoutListTile(index);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Payment Method',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04)),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
                child: Container(
                  height: size.width * .5,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                paymentItem = 'nogot';
                              });
                            },
                            child: paymentItem == 'nogot'
                                ? Image.asset(
                                    'assets/app_icon/body_icon/squire_pink_box.png')
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        'assets/app_icon/body_icon/squire_grey_box.png'),
                                  ),
                          ),
                          Container(
                            height: size.width * .15,
                            width: size.width * .15,
                            child: Image.asset(
                              'assets/app_icon/body_icon/nogot_logo.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                paymentItem = 'bkash';
                              });
                            },
                            child: paymentItem == 'bkash'
                                ? Image.asset(
                                    'assets/app_icon/body_icon/squire_pink_box.png')
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        'assets/app_icon/body_icon/squire_grey_box.png'),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: size.width * .15,
                              width: size.width * .15,
                              child: Image.asset(
                                'assets/app_icon/body_icon/bkash_logo.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                paymentItem = 'ssl';
                              });
                            },
                            child: paymentItem == 'ssl'
                                ? Image.asset(
                                    'assets/app_icon/body_icon/squire_pink_box.png')
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        'assets/app_icon/body_icon/squire_grey_box.png'),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: size.width * .15,
                              width: size.width * .15,
                              child: Image.asset(
                                'assets/app_icon/body_icon/ssl_logo.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Shipping fee',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04)),
                            Row(
                              children: [
                                Image.asset('assets/app_icon/body_icon/tk.png'),
                                Text('20.00',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sub total',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04)),
                            Row(
                              children: [
                                Image.asset('assets/app_icon/body_icon/tk.png'),
                                Text('79.95',
                                    style: TextStyle(
                                        fontFamily: 'taviraj',
                                        color: ColorsVariables.textColor,
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * .04)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: ColorsVariables.dividerColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total',
                                style: TextStyle(
                                    fontFamily: 'taviraj',
                                    color: ColorsVariables.textColor,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * .04)),
                            Row(
                              children: [
                                Image.asset('assets/app_icon/body_icon/tk.png'),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('99.95',
                                      style: TextStyle(
                                          fontFamily: 'taviraj',
                                          color: ColorsVariables.textColor,
                                          fontStyle: FontStyle.normal,
                                          fontSize: size.width * .04)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: size.width * .1),
                child: Container(
                    width: size.width * .8,
                    height: size.width * .13,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xffC31A65).withOpacity(1),
                          Color(0xffFA4494).withOpacity(1)
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Text(
                      'Payment',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: size.width * .04,
                      ),
                    )),
              ),
              // GradientButton(
              //   height: size.width * .3,
              //   width: size.width,
              //   child: Text('Payment',
              //       style: TextStyle(
              //           fontFamily: 'taviraj',
              //           color: ColorsVariables.textColor,
              //           fontStyle: FontStyle.normal,
              //           fontSize: size.width * .04)),
              // ),
              SizedBox(
                height: 300,
              ),
              Center(
                  child: Text('Checkout Page',
                      style: TextStyle(
                          fontFamily: 'taviraj',
                          color: ColorsVariables.textColor,
                          fontStyle: FontStyle.normal,
                          fontSize: size.width * .04))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkoutListTile(int index) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selectIndex.add(index);
                    });

                    print(selectIndex);
                  },
                  child: selectIndex.contains(index)
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              selectIndex.remove(index);
                            });
                          },
                          child: Image.asset(
                              'assets/app_icon/body_icon/squire_pink_box.png'),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                              'assets/app_icon/body_icon/squire_grey_box.png'),
                        ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Home',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.textColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04)),
                    Text('(+880) 1310000000',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.dividerColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04)),
                    Text('10/B , Bashundara City , \nDhaka 1000',
                        style: TextStyle(
                            fontFamily: 'taviraj',
                            color: ColorsVariables.dividerColor,
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * .04)),
                  ],
                ),

                // Image.asset('assets/app_icon/body_icon/drop_circuler_add.png')
              ],
            ),
            InkWell(onTap: () {}, child: Icon(Icons.edit_outlined)),
          ],
        ),
      ),
    );
  }
}
