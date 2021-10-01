import 'package:flutter/material.dart';

class FormAuth extends StatelessWidget {
  final label;
  final IconData icons;
  final obsecure;
  final TextEditingController controller;
  const FormAuth(
      {Key? key,
      this.label,
      required this.controller,
      required this.icons,
      this.obsecure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: obsecure,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(4),
            child: Icon(icons),
          ),
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }
}
