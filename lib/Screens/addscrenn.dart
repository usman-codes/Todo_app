import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/Utils/appstyles.dart';
import 'package:todo_app/Widgets/dateandtime_widget.dart';
import 'package:todo_app/Widgets/input_widget.dart';
import 'package:todo_app/Widgets/radio_widget.dart';

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
          const Gap(10),
          const Textfieldwidget(hinttext: 'Add Task Name', maxlines: 1),
          const Gap(20),
          const Text(
            'Description',
            style: Appstyles.headingone,
          ),
          const Gap(10),
          const Textfieldwidget(hinttext: 'Description', maxlines: 5),
          const Gap(20),
          Row(
            children: [
              Expanded(
                child: Radiowidget(
                  categorycolor: Colors.lightGreen.shade300,
                  titleradio: 'Learning',
                ),
              ),
              Expanded(
                  child: Radiowidget(
                      categorycolor: Colors.blue.shade200, titleradio: 'Work')),
              Expanded(
                  child: Radiowidget(
                      categorycolor: Colors.red.shade200,
                      titleradio: 'General')),
            ],
          ),
          const Gap(20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Dateandtime(
                titletext: 'Date',
                valutext: 'dd/mm/yy',
                iconsection: CupertinoIcons.calendar,
              ),
              Gap(12),
              Dateandtime(
                titletext: 'Time',
                valutext: 'hh : mm',
                iconsection: CupertinoIcons.time,
              )
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.black)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 70)),
                  onPressed: () {},
                  child: const Text('Cancel')),
              const Gap(10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 53, 57, 61),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 70)),
                  onPressed: () {},
                  child: const Text('Create')),
            ],
          )
        ],
      ),
    );
  }
}
