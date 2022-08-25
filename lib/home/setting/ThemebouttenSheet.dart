import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/Settingprovider.dart';

class ThemebouttenSheet extends StatefulWidget {
  @override
  State<ThemebouttenSheet> createState() => _ThemebouttenSheetState();
}

class _ThemebouttenSheetState extends State<ThemebouttenSheet> {
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<Settingprovider>(context);

    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                settingprovider.changTheme(ThemeMode.light);
              },
              child: settingprovider.isDarkMode()
                  ? getUnSelecteditems(AppLocalizations.of(context)!.light)
                  : getSelecteditems(AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                settingprovider.changTheme(ThemeMode.dark);
              },
              child: settingprovider.isDarkMode()
                  ? getSelecteditems(AppLocalizations.of(context)!.dark)
                  : getUnSelecteditems(AppLocalizations.of(context)!.dark)),
        ],
      ),
    );
  }

  Widget getSelecteditems(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: Theme.of(context).primaryColor)),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnSelecteditems(String text) {
    return Row(
      children: [Text(text, style: Theme.of(context).textTheme.headline2)],
    );
  }
}
