import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamyverson1/home/hadeth/hadeth.dart';
import 'package:provider/provider.dart';

import '../providers/Settingprovider.dart';

class Hadethdeteils extends StatefulWidget {
  static const String routename = 'hadethdeteils';

  @override
  State<Hadethdeteils> createState() => _SuradeteilsState();
}

class _SuradeteilsState extends State<Hadethdeteils> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeeth;
    var settingprovider = Provider.of<Settingprovider>(context);

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
          body: Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 96),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(24)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                alignment: Alignment.center,
                child: Text(args.content,
                    style: Theme.of(context).textTheme.bodyText1),
              ))),
    );
  }
}
