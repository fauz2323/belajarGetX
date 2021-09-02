import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  final VoidCallback fun;
  final IconData icon;
  final title;

  const HomeMenu({Key? key, required this.fun, required this.icon, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: fun,
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.black)),
          ),
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 1,
                  color: Colors.amberAccent,
                )),
                child: Icon(icon, size: 40),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
