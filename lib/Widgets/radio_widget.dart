// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Radiowidget extends StatelessWidget {
  const Radiowidget({
    super.key,
    required this.categorycolor,
    required this.titleradio,
  });

  final Color categorycolor;
  final String titleradio;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categorycolor),
        child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Transform.translate(
                offset: const Offset(-22, 0),
                child: Text(
                  titleradio,
                  style: TextStyle(
                      color: categorycolor, fontWeight: FontWeight.w700),
                )),
            value: 1,
            groupValue: 0,
            onChanged: (value) {}),
      ),
    );
  }
}
