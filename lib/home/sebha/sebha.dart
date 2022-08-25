import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Settingprovider.dart';

class Sebha extends StatefulWidget {
  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  double angle = 0;
  int index = 0;
  var counter = 0;

  List<String> text = ['سبحان الله', 'الحمدلله', 'الله اكبر'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var settingprovider = Provider.of<Settingprovider>(context);
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: size.height * .4,
              child: Stack(children: [
                Positioned(
                  child: settingprovider.isDarkMode()
                      ? Image.asset('assent/images/head of seb7a.png')
                      : Image.asset('assent/images/head_sebha_logo.png'),
                  left: size.width * .48,
                ),
                Positioned(
                  child: InkWell(
                    onTap: onClicl,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Transform.rotate(
                      angle: angle,
                      child: settingprovider.isDarkMode()
                          ? Image.asset('assent/images/body_sebha_dark.png')
                          : Image.asset('assent/images/body_sebha_logo.png'),
                    ),
                  ),
                  top: 80,
                  right: size.width * .21,
                  left: size.width * .21,
                ),
              ]),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                alignment: Alignment.center,
                width: 60,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Theme.of(context).primaryColor),
                child: Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline3,
                )),
            SizedBox(
              height: 15,
            ),
            Container(
                width: 135,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: settingprovider.isDarkMode()
                        ? Color(0xFFFACC1D)
                        : Color(0xFFB7935F)),
                child: Text(
                  "${text[index]}",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: settingprovider.isDarkMode()
                          ? Colors.black
                          : Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  onClicl() {
    angle = angle - 3;
    counter++;
    if (counter == 34) {
      index++;
      counter = 0;
    }
    if (index == 3) {
      index = 0;
    }
    setState(() {});
  }
}
