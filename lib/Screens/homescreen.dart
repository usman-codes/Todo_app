// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/Provider/currentdate_provider.dart';

import 'package:todo_app/Provider/service_provider.dart';
import 'package:todo_app/Screens/addscrenn.dart';
import 'package:todo_app/Widgets/cardtodolistwidget.dart';

class Homescreen extends ConsumerWidget {
  const Homescreen({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchstreamProvider);
    final currentdate = ref.watch(maindateProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: ListTile(
          leading: CircleAvatar(
            child: Image.asset("assets/profileg.png"),
          ),
          title: const Text(
            'Hello I\'m',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          subtitle: const Text(
            "Mohammad Usman",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(CupertinoIcons.calendar))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Today\'s Task',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      currentdate,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 53, 57, 61),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () => showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const Addnewtaskmodel1()),
                  child: const Text(
                    '+ New Task',
                  ),
                ),
              ],
            ),
            const Gap(20),
            Expanded(
              child: todoData.when(
                data: (todos) {
                  return ListView.builder(
                    itemCount: todos.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Cardtodolistwidget(
                      getindex: index,
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    Center(child: Text(error.toString())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
