import 'package:flutter/material.dart';

class BalanceHome extends StatelessWidget {
  final balance;
  final title;
  final image;
  final Widget widget;

  BalanceHome(
      {Key? key, this.balance, this.title, this.image, required this.widget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 65 / 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 9,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(
                image,
                width: 40,
                height: 40,
              ),
              Text(title),
              Text(balance),
            ],
          ),
          Container(
            child: widget,
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
