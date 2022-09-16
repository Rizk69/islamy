import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islamyverson1/home/radio/Model/respons.dart';
import 'package:provider/provider.dart';

import '../providers/Settingprovider.dart';

class Radioo extends StatefulWidget {
  @override
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<Radioo> {
  late Future<Respons> respons;
  static late AudioPlayer audioPlayer = AudioPlayer();
  bool _h = true;

  @override
  void initState() {
    // TODO: implement initState
    respons = getRadio();
  }

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<Settingprovider>(context);

    return FutureBuilder<Respons>(
        future: getRadio(),
        builder: (buildContext, snapShot) {
          if (snapShot.hasError) {
            return IconButton(
                onPressed: () {
                  respons = getRadio();
                },
                icon: Icon(
                  Icons.refresh,
                  size: 25,
                  color: Colors.white,
                ));
          } else if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            var data = snapShot.data;
            return Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Image.asset(
                      'assent/images/radio.png',
                    )),
                Expanded(
                    flex: 3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: PageScrollPhysics(),
                      itemBuilder: (BuildContext context, index) => Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Text(
                              '${data?.radios![index].name}',
                              style: TextStyle(
                                fontSize: 30,
                                color: settingprovider.isDarkMode()
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (index == index) pause();
                                      pause();
                                    },
                                    icon: Icon(
                                      Icons.pause,
                                      size: 35,
                                      color: settingprovider.isDarkMode()
                                          ? Color(0XFFFACC1D)
                                          : Color(0XFFB7935F),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (_h = true) {
                                        play(data?.radios![index].radioUrl ??
                                            '');
                                      } else {
                                        pause();
                                      }
                                    },
                                    icon: Icon(
                                      Icons.play_arrow,
                                      size: 35,
                                      color: settingprovider.isDarkMode()
                                          ? Color(0XFFFACC1D)
                                          : Color(0XFFB7935F),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      itemCount: data?.radios?.length,
                    )),
              ],
            );
          }
        });
  }

  Future<Respons> getRadio() async {
    var res = await http
        .get(Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));
    if (res.statusCode == 200) {
      return Respons.fromJson(jsonDecode(utf8.decode(res.bodyBytes)));
    } else {
      throw Exception('Failed');
    }
  }

  play(String url) async {
    _h = false;
    int result = await audioPlayer.play(url);
  }

  static pause() async {
    await audioPlayer.pause();
  }
}
