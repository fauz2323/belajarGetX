import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailHistory extends StatelessWidget {
  final wallet;
  final amount;
  final DateTime date;
  final page;

  const DetailHistory(
      {Key? key, this.wallet, this.amount, required this.date, this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          height: height * 60 / 100,
          width: width * 80 / 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.verified,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
              Text(
                page,
                style: TextStyle(color: Colors.blue, fontSize: 26),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "$amount Tron",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              Text(
                (page == 'Deposit Tron') ? "from Wallet : " : "to Wallet",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(border: Border.all(width: 0.2)),
                child: Text(
                  '$wallet',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date: "),
                    Text(DateFormat('dd-mm-yyy ~ kk:mm').format(date)),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
