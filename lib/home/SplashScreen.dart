import 'package:flutter/material.dart';
import 'package:islamyverson1/home/MainScreen.dart';
import 'package:islamyverson1/home/providers/Settingprovider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 15), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homescreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<Settingprovider>(context);

    return Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assent/images/bg2.jpg'))),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assent/images/logo2.jpg'),
              Spacer(),
              Text(
                'Programing by Mohamed Rizk',
                style: TextStyle(color: Colors.black, fontSize: 25),
              )
            ],
          ),
        ));
  }
}
