import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamyverson1/home/quran/sura_deteils.dart';

class SuraName extends StatelessWidget {
  String title;
  int index;

  SuraName(this.title, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Suradeteils.routename,
            arguments: Suradeteailsarg(index, title));
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Text(title, style: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}
