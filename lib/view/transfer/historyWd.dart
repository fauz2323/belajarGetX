import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profmoonv2/view/notifScreen/success.dart';

class HistoryWd extends StatelessWidget {
  const HistoryWd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
      ),
      body: Container(child: ListView.builder(itemBuilder: (context, i) {
        return ListTile(
          title: Text("data"),
        );
      })),
    );
  }
}
