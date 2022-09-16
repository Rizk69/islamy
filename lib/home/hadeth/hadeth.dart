import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamyverson1/home/hadeth/HadethName.dart';
import 'package:provider/provider.dart';

import '../providers/Settingprovider.dart';

class Hadeth extends StatefulWidget {
  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  List<Hadeeth> hadethview = [];

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<Settingprovider>(context);

    if (hadethview.isEmpty) readFile();

    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image(image: AssetImage('assent/images/hadeth_logo.png'))],
      ),
      const SizedBox(
        height: 5,
      ),
      Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal:
              BorderSide(color: Theme.of(context).primaryColor, width: 2)),
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            settingprovider.isenglish() ? 'Elahadeth' : 'ألحديث',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
      Expanded(
        child: ListView.separated(
          itemBuilder: (_, index) {
            return Center(child: HadethName(hadethview[index]));
          },
          itemCount: hadethview.length,
          separatorBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 64),
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              height: 2,
            );
          },
        ),
      )
    ]);
  }

  void readFile() async {
    String ahadethfile =
        await rootBundle.loadString('assent/files/ahadeth.txt');
    List<Hadeeth> ahadethoffile = [];
    List<String> allhadethl = ahadethfile.trim().split('#');
    for (int i = 0; i < allhadethl.length; i++) {
      List<String> hadethlines = allhadethl[i].trim().split('\n');
      String title = hadethlines[0];
      hadethlines.remove(0);
      String content = hadethlines.join('\n');
      Hadeeth h = Hadeeth(title, content);
      ahadethoffile.add(h);
    }
    hadethview = ahadethoffile;
    setState(() {});
  }
}

class Hadeeth {
  String title;
  String content;

  Hadeeth(this.title, this.content);
}
