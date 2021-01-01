import 'package:currency_ui/API/data.dart';
import 'package:currency_ui/Screens/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../const.dart';

class HomeScreen extends StatefulWidget {
  final allData;

  HomeScreen({this.allData});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Data data = Data();

  Future<List<String>> comeData() {
    return data.get1USD(widget.allData);
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.allData);
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var date = DateFormat.yMd().add_jm().format(new DateTime.now());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            child: WaveWidget(
              config: CustomConfig(
                colors: [
                  kPrimeColor,
                  Color(0xFF4565B0),
                ],
                durations: [4000, 5000],
                heightPercentages: [0.01, 0.05],
                blur: MaskFilter.blur(BlurStyle.solid, 5),
              ),
              waveAmplitude: 35.00,
              waveFrequency: 3,
              //number of curves in waves
              backgroundColor: Color(0xFF677DB7),
              //background colors
              size: Size(
                double.infinity,
                double.infinity,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE1E9FF),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(
                top: screenSize.width * .3,
                left: screenSize.width * .03,
                right: screenSize.width * .03,
                bottom: screenSize.width * .1),
            width: screenSize.width,
            height: screenSize.height * .08,
            child: Row(
              children: [
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
                    child: Text(
                      'automatic',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        curve: Curves.linear,
                        type: PageTransitionType.scale,
                        alignment: Alignment.topCenter,
                        child: SearchScreen(allData: widget.allData,),
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
                      child: Text('manual',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFFA3AABC)),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenSize.height * .25, left: screenSize.height * .03),
            child: Text(
              'Last update at $date',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenSize.height * .3, left: screenSize.height * .03),
            child: Row(
              children: [
                Image.network(
                    'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/35px-Flag_of_the_United_States.svg.png'),
                SizedBox(
                  width: screenSize.width * .04,
                ),
                Text(
                  '1 USD equal ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: comeData(),
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
                  padding: EdgeInsets.only(top: screenSize.height * .33),
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
                              '${currenciesList[index]} ${snapShot.data[index]}'),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
