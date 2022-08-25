import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamyverson1/home/hadeth/hadeth.dart';

import 'Hadeth_deteils.dart';
import 'hadeth.dart';

class HadethName extends StatelessWidget {
  Hadeeth Hadeth;

  HadethName(this.Hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Hadethdeteils.routename,
            arguments: Hadeth);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Text(Hadeth.title, style: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}
