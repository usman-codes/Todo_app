import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/Models/todomodel.dart';
import 'package:todo_app/Provider/service_provider.dart';
import 'package:todo_app/Screens/editscreen.dart';
import 'package:todo_app/Utils/appstyles.dart';
class Cardtodolistwidget extends ConsumerWidget {
  const Cardtodolistwidget({
    super.key,
    required this.getindex,
  });
  final int getindex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tododata = ref.watch(fetchstreamProvider);
    return tododata.when(
      data: (tododata) {
        Color categoryColor = Colors.white;
        final getcategory = tododata[getindex].category;
        switch (getcategory) {
          case 'Learning':
            categoryColor = Colors.green.shade300;
            break;
          case 'Working':
            categoryColor = Colors.blue.shade300;
            break;
          case 'General':
            categoryColor = Colors.red.shade300;
            break;
        }
        final todo = tododata[getindex];
        return Dismissible(
          key: Key(todo.docid ?? ''), // Assuming each todo item has a unique ID
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            // Remove the item from the data source.
            ref.read(serviceProvider).deletetask(todo.docid);
            showCustomFlushbar(
              context: context,
              message: 'Successfully Deleted',
              backgroundColor: Colors.blue.shade300,
              icon: Icons.delete_forever_outlined,
            );
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: categoryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  width: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => Edittaskmodel(todo: todo),
                              );
                            },
                            icon: const Icon(Icons.edit_outlined),
                          ),
                          title: Text(
                            todo.titletask,
                            maxLines: 1,
                            style: TextStyle(
                              decoration: todo.isDone ? TextDecoration.lineThrough : null,
                            ),
                          ),
                          subtitle: Text(
                            todo.description,
                            maxLines: 2,
                            style: TextStyle(
                              decoration: todo.isDone ? TextDecoration.lineThrough : null,
                            ),
                          ),
                          trailing: Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              shape: const CircleBorder(),
                              activeColor: Colors.black,
                              value: todo.isDone,
                              onChanged: (value) {
                                final updatedTodo = Todomodel(
                                  docid: todo.docid,
                                  titletask: todo.titletask,
                                  description: todo.description,
                                  category: todo.category,
                                  datetask: todo.datetask,
                                  timetask: todo.timetask,
                                  isDone: value ?? false, // Update the isDone status
                                );
                                ref.read(serviceProvider).updateTask(updatedTodo);
                              },
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -12),
                          child: Container(
                            child: Column(
                              children: [
                                Divider(
                                  color: Colors.grey.shade200,
                                  thickness: 1.5,
                                ),
                                Row(
                                  children: [
                                    Text(todo.datetask),
                                    const Gap(12),
                                    Text(todo.timetask),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(stackTrace.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
