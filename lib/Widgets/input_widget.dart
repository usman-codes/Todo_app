// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
  const Textfieldwidget({
    super.key,
    required this.hinttext,
    required this.maxlines,
  });
  final String hinttext;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
          decoration: InputDecoration(
            hintText: hinttext,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          maxLines: maxlines,
        ));
  }
}
