// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_app/Provider/radio_provider.dart';

class Radiowidget extends ConsumerWidget {
  const Radiowidget({
    super.key,
    required this.categorycolor,
    required this.titleradio,
    required this.valueinput,
    required this.onchanged,
  });

  final Color categorycolor;
  final String titleradio;
  final int valueinput;
  final VoidCallback onchanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio = ref.watch(radioProvider);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categorycolor),
        child: RadioListTile(
            activeColor: categorycolor,
            contentPadding: EdgeInsets.zero,
            title: Transform.translate(
                offset: const Offset(-22, 0),
                child: Text(
                  titleradio, 
                  style: TextStyle(
                      color: categorycolor, fontWeight: FontWeight.w700),
                )),
            value: valueinput,
            groupValue: radio,
            onChanged: (value) {
              onchanged();
            }),
      ),
    );
  }
}
