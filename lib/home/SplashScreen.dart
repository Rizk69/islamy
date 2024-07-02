import 'package:flutter/material.dart';
import 'package:islamyverson1/home/MainScreen.dart';
import 'package:islamyverson1/home/providers/Settingprovider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String route = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Homescreen();

        //HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<Settingprovider>(context);

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(settingprovider.isDarkMode()
                    ? "assent/images/bg.jpg"
                    : 'assent/images/bg2.jpg'))),
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Center(
                    child: CircleAvatar(
                  radius: 100,
                  backgroundImage: ExactAssetImage("assent/images/logo2.jpg"),
                )),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      'Programing by Mohamed Rizk',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.lerp(
                              FontWeight.normal,
                              FontWeight.w400,
                              ScrollDragController
                                  .momentumRetainVelocityThresholdFactor)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
