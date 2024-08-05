import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Models/todomodel.dart';
import 'package:todo_app/Provider/radio_provider.dart';
import 'package:todo_app/Provider/service_provider.dart';
import 'package:todo_app/Utils/appstyles.dart';
import 'package:todo_app/Widgets/dateandtime_widget.dart';
import 'package:todo_app/Widgets/input_widget.dart';
import 'package:todo_app/Widgets/radio_widget.dart';

import '../Provider/dateandtimeprovider.dart';

class Edittaskmodel extends ConsumerStatefulWidget {
  final Todomodel todo; // Add this parameter

  const Edittaskmodel({super.key, required this.todo});

  @override
  _EdittaskmodelState createState() => _EdittaskmodelState();
}

class _EdittaskmodelState extends ConsumerState<Edittaskmodel> {
  late final TextEditingController _titleController;
  late final TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.titletask);
    _descController = TextEditingController(text: widget.todo.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dateprov = ref.watch(dateProvider);

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
              'Edit Task Todo',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
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
          Textfieldwidget(
            hinttext: 'Add Task Name',
            maxlines: 1,
            txtcontroller: _titleController,
          ),
          const Gap(20),
          const Text(
            'Description',
            style: Appstyles.headingone,
          ),
          const Gap(10),
          Textfieldwidget(
            hinttext: 'Description',
            maxlines: 5,
            txtcontroller: _descController,
          ),
          const Gap(20),
          Row(
            children: [
              Expanded(
                child: Radiowidget(
                  categorycolor: Colors.lightGreen.shade300,
                  titleradio: 'LRN',
                  valueinput: 1,
                  onchanged: () {
                    ref.read(radioProvider.notifier).update((state) => 1);
                  },
                ),
              ),
              Expanded(
                child: Radiowidget(
                  categorycolor: Colors.blue.shade200,
                  titleradio: 'WRK',
                  valueinput: 2,
                  onchanged: () {
                    ref.read(radioProvider.notifier).update((state) => 2);
                  },
                ),
              ),
              Expanded(
                child: Radiowidget(
                  categorycolor: Colors.red.shade200,
                  titleradio: 'GNL',
                  valueinput: 3,
                  onchanged: () {
                    ref.read(radioProvider.notifier).update((state) => 3);
                  },
                ),
              ),
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Dateandtime(
                titletext: 'Date',
                valutext: dateprov,
                iconsection: CupertinoIcons.calendar,
                ontap: () async {
                  final getvalue = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2025),
                  );
                  if (getvalue != null) {
                    final format = DateFormat.yMMMEd();
                    ref.read(dateProvider.notifier).update(
                          (state) => format.format(getvalue),
                        );
                  }
                },
              ),
              const Gap(12),
              Dateandtime(
                titletext: 'Time',
                valutext: ref.watch(timeProvider),
                iconsection: CupertinoIcons.time,
                ontap: () async {
                  final gettime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  if (gettime != null) {
                    ref
                        .read(timeProvider.notifier)
                        .update((state) => gettime.format(context));
                  }
                },
              ),
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
                    side: const BorderSide(color: Colors.black),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 70),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const Gap(10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 53, 57, 61),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 70),
                ),
                onPressed: () {
                  if (_titleController.text.isEmpty ||
                      _descController.text.isEmpty ||
                      ref.read(radioProvider) == 0 ||
                      ref.read(dateProvider) == 'dd/mm/yy' ||
                      ref.read(timeProvider) == 'hh: mm') {
                    showCustomFlushbar(
                      context: context,
                      message: 'Please fill all fields',
                      icon: Icons.error_outline,
                      backgroundColor: Colors.red.shade300,
                    );
                    return;
                  }

                  final getradiovalue = ref.read(radioProvider);
                  String category = ' ';
                  switch (getradiovalue) {
                    case 1:
                      category = 'Learning';
                      break;
                    case 2:
                      category = 'Working';
                      break;
                    case 3:
                      category = 'General';
                      break;
                  }

                  final updatedTodo = Todomodel(
                    docid: widget.todo.docid, // Use existing docid for update
                    titletask: _titleController.text,
                    description: _descController.text,
                    category: category,
                    datetask: ref.read(dateProvider),
                    timetask: ref.read(timeProvider),
                    isDone: widget.todo.isDone, // Retain the existing value
                  );

                  ref.read(serviceProvider).updateTask(updatedTodo); // Call update method
                  Navigator.pop(context);
                  showCustomFlushbar(
                    context: context,
                    message: 'Task Updated Successfully',
                    icon: Icons.check,
                    backgroundColor: Colors.black,
                  );

                  ref.read(radioProvider.notifier).update((state) => 0);
                  ref.read(dateProvider.notifier).update((state) => 'dd/mm/yy');
                  ref.read(timeProvider.notifier).update((state) => 'hh: mm');
                },
                child: const Text('Edit'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
