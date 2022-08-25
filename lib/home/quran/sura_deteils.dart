import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamyverson1/home/quran/revers_widget.dart';
import 'package:provider/provider.dart';

import '../providers/Settingprovider.dart';

class Suradeteils extends StatefulWidget {
  static const String routename = 'suradeteils';

  @override
  State<Suradeteils> createState() => _SuradeteilsState();
}

class _SuradeteilsState extends State<Suradeteils> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<Settingprovider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as Suradeteailsarg;
    if (ayat.isEmpty) readFile(args.index);
    return Container(
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(settingprovider.getBackground()),
      )),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          body: ayat.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 96),
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(24)),
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return ReversWidget(ayat[index], index);
                    },
                    itemCount: ayat.length,
                    separatorBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 64),
                        color: Theme.of(context).primaryColor,
                        width: double.infinity,
                        height: 2,
                      );
                    },
                  ),
                )),
    );
  }

  void readFile(int index) async {
    String content =
        await rootBundle.loadString('assent/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    ayat = lines;
    setState(() {});
  }
}

class Suradeteailsarg {
  int index;
  String title;

  Suradeteailsarg(this.index, this.title);
}
