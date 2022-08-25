import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReversWidget extends StatelessWidget {
  String content;
  int index;

  ReversWidget(this.content, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.center,
      child: Text('{ ${index + 1} } $content',
          style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
