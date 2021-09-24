import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateVersion extends StatelessWidget {
  launcer() async {
    await canLaunch('https://flutter.dev')
        ? await launch('https://flutter.dev')
        : throw "Error link not found";
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          height: height * 50 / 100,
          width: width * 80 / 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 5 / 100,
              ),
              Text(
                "Update Your Apps",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: height * 5 / 100,
              ),
              Icon(
                Icons.security_update_rounded,
                size: 150,
              ),
              SizedBox(
                height: height * 5 / 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    launcer();
                  },
                  child: Text('UPDATE'))
            ],
          ),
        ),
      ),
    );
  }
}
