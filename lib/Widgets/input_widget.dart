import 'package:flutter/material.dart';

class Textfieldwidget extends StatefulWidget {
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
  State<Textfieldwidget> createState() => _TextfieldwidgetState();
}

class _TextfieldwidgetState extends State<Textfieldwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          controller: widget.txtcontroller,
          decoration: InputDecoration(
            hintText: widget.hinttext,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          maxLines: widget.maxlines,
        ));
  }
}
