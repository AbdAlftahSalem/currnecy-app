import 'package:currency_ui/API/networkData.dart';
import 'package:currency_ui/Screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  API s = API();

  void getData() async {
    var currencyData = await s.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen(
            allData: currencyData,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
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
            child: WaveWidget(
              config: CustomConfig(
                colors: [
                  Color(0xFF5C77B9),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenSize.width,
              height: screenSize.height * 3 / 4,
              // color: Colors.black,
              color: Color(0xFF4565B0),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    height: MediaQuery.of(context).size.height * 3 / 4,
                    child: Column(
                      children: [
                        Image.asset(
                          'assetes/images/1.png',
                          fit: BoxFit.cover,
                          width: screenSize.width * .3,
                        ),
                        SizedBox(
                          height: screenSize.height * .08,
                        ),
                        Image.asset(
                          'assetes/images/2.png',
                          fit: BoxFit.cover,
                          width: screenSize.width * .5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenSize.height * .4),
                          child: Text(
                            '@abd_al_ftah_alshanti',
                            style: TextStyle(
                                color: Color(0xFFE2E4D6),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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
