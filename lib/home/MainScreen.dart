import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamyverson1/home/hadeth/hadeth.dart';
import 'package:islamyverson1/home/providers/Settingprovider.dart';
import 'package:islamyverson1/home/quran/quran.dart';
import 'package:islamyverson1/home/radio/radio.dart';
import 'package:islamyverson1/home/sebha/sebha.dart';
import 'package:islamyverson1/home/setting/Setting.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  static const String routename = 'onescreen';

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<Settingprovider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(settingprovider.getBackground()),
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(AppLocalizations.of(context)!.app_title)),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            currentIndex: selectedindex,
            onTap: (index) {
              selectedindex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assent/images/icon_radio.png')),
                  label: AppLocalizations.of(context)!.radio_title),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assent/images/icon_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha_title),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assent/images/icon_hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth_title),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assent/images/icon_quran.png')),
                  label: AppLocalizations.of(context)!.quran_title),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.setting_title),
            ],
          ),
        ),
        body: tabs[selectedindex],
      ),
    );
  }

  List<Widget> tabs = [Radioo(), Sebha(), Hadeth(), Quran(), Setting()];
}
