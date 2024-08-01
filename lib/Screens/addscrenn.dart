import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/Utils/appstyles.dart';
import 'package:todo_app/Widgets/input_widget.dart';

class Addnewtaskmodel extends StatelessWidget {
  const Addnewtaskmodel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.center,
              'New Task Todo',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade300,
          ),
          const Gap(12),
          const Text(
            'Title Task',
            style: Appstyles.headingone,
          ),
          const Gap(6),
          const Textfieldwidget(hinttext: 'Add Task Name', maxlines: 1),
          const Gap(12),
          const Text(
            'Description',
            style: Appstyles.headingone,
          ),
          const Gap(6),
          const Textfieldwidget(hinttext: 'Description', maxlines: 5)
        ],
      ),
    );
  }
}
