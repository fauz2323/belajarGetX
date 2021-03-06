import 'package:flutter/material.dart';

class BetMenu extends StatelessWidget {
  final String text;
  final VoidCallback click;
  final Widget icon;

  const BetMenu(
      {Key? key, required this.text, required this.click, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            icon,
            SizedBox(
              height: 5,
            ),
            Text(text),
          ],
        ),
        onTap: click,
      ),
    );
  }
}
