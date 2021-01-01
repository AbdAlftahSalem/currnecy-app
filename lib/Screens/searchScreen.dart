import 'dart:ui';

import 'package:currency_ui/API/data.dart';
import 'package:currency_ui/Screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../const.dart';

class SearchScreen extends StatefulWidget {
  final allData;

  SearchScreen({this.allData});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double num = 0;
  Data dataClass = Data();
  var date = DateFormat.yMd().add_jm().format(new DateTime.now());

  Future<List<double>> anyUSD(double num) async {
    var finalData = await dataClass.getAnyUSD(num);
    return finalData;
  }

  @override
  void initState() {
    super.initState();
    anyUSD(num);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            color: Colors.white,
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height * .5,
            decoration: BoxDecoration(
              color: kPrimeColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(screenSize.width * .1),
                bottomRight: Radius.circular(screenSize.width * .1),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE1E9FF),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(
              top: screenSize.width * .15,
              left: screenSize.width * .03,
              right: screenSize.width * .03,
              bottom: screenSize.width * .1,
            ),
            width: screenSize.width,
            height: screenSize.height * .08,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        curve: Curves.linear,
                        type: PageTransitionType.scale,
                        alignment: Alignment.topCenter,
                        child: HomeScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: screenSize.width * .03),
                    child: Container(
                      width: screenSize.width * .4,
                      padding: EdgeInsets.symmetric(
                          vertical: screenSize.width * .045,
                          horizontal: screenSize.width * .045),
                      decoration: BoxDecoration(
                        color: Color(0xFFE1E9FF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'automatic',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFA3AABC)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenSize.width * .03),
                  child: Container(
                    width: screenSize.width * .4,
                    padding: EdgeInsets.symmetric(
                        vertical: screenSize.width * .045,
                        horizontal: screenSize.width * .045),
                    decoration: BoxDecoration(
                      color: kPrimeColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text('manual',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenSize.width * .34,
                horizontal: screenSize.width * .1,
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 0, color: Color(0xFFEEF2FE)),
                  ),
                  hintText: "Enter number (USD)",
                  hintStyle: TextStyle(fontSize: 18, color: Color(0xFF171A21)),
                  filled: true,
                  fillColor: Color(0xFFEEF2FE),
                ),
                onChanged: (value) {
                  setState(
                    () {
                      num = double.parse(value);
                      anyUSD(num);
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenSize.height * .26,
                horizontal: screenSize.height * .02),
            child: Text(
              'last update $date',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenSize.height * .3,
                horizontal: screenSize.height * .02),
            child: Row(
              children: [
                Image.network(
                    'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/35px-Flag_of_the_United_States.svg.png'),
                SizedBox(
                  width: screenSize.width * .04,
                ),
                Text(
                  '$num USD equal ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: dataClass.getAnyUSD(num),
              builder: (context, snapShot) {
                if (snapShot.data == null) {
                  return Center(
                    child: SpinKitRotatingCircle(
                      color: Colors.white,
                      size: 100.0,
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(top: screenSize.height * .34),
                    child: ListView.builder(
                      itemCount: flag.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFE1E9FF),
                            borderRadius:
                                BorderRadius.circular(screenSize.width * .04),
                          ),
                          child: ListTile(
                            leading: Image.network(flag[index]),
                            title: Text(countryName[index]),
                            subtitle: Text(
                                '${currenciesList[index]} ${snapShot.data[index].toString()}'),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
