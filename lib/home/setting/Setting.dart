import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/Settingprovider.dart';
import 'LanguagebouttenSheet.dart';
import 'ThemebouttenSheet.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<Settingprovider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        SizedBox(
          height: 30,
        ),
        Text(
          AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          height: 4,
        ),
        InkWell(
          onTap: () {
            showLanguagebouttenSheet();
          },
          child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: BorderRadius.circular(13),
                color: Theme.of(context).backgroundColor,
              ),
              child: Text(
                settingprovider.isenglish() ? 'English' : 'العربيه',
                style: Theme.of(context).textTheme.headline2,
              )),
        ),
        SizedBox(
          height: 15,
        ),
        Text(AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyText1),
        SizedBox(
          height: 4,
        ),
        InkWell(
          onTap: () {
            showThemebouttenSheet();
          },
          child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: BorderRadius.circular(13),
                color: Theme.of(context).backgroundColor,
              ),
              child: Text(
                settingprovider.isDarkMode()
                    ? AppLocalizations.of(context)!.dark
                    : AppLocalizations.of(context)!.light,
                style: Theme.of(context).textTheme.headline2,
              )),
        ),
      ]),
    );
  }

  void showLanguagebouttenSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguagebouttenSheet();
        });
  }

  void showThemebouttenSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemebouttenSheet();
        });
  }
}
