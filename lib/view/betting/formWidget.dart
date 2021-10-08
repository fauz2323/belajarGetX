import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormBetting extends StatelessWidget {
  final name;
  final status;
  final TextEditingController controller;
  FormBetting({Key? key, this.name, required this.controller, this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: TextFormField(
        controller: controller,
        enabled: (status == 'paid') ? true : false,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(11.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(11.0),
          ),
        ),
      ),
      padding: EdgeInsets.all(8),
    );
  }
}
