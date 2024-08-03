import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
  const Textfieldwidget({
    super.key,
    required this.hinttext,
    required this.maxlines,
    required this.txtcontroller,
  });
  final String hinttext;
  final int maxlines;
  final TextEditingController txtcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          controller: txtcontroller,
          decoration: InputDecoration(
            hintText: hinttext,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          maxLines: maxlines,
        ));
  }
}
