// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:todo_app/Utils/appstyles.dart';

class Dateandtime extends StatelessWidget {
  const Dateandtime({
    Key? key,
    required this.titletext,
    required this.valutext,
    required this.iconsection,
  }) : super(key: key);
  final String titletext;
  final String valutext;
  final IconData iconsection;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titletext, style: Appstyles.headingone),
            const Gap(6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [Icon(iconsection), const Gap(12), Text(valutext)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
