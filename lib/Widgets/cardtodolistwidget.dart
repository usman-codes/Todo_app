import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/Provider/service_provider.dart';

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
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: categoryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12))),
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
                            ref
                                .read(serviceProvider)
                                .deletetask(tododata[getindex].docid);
                            Flushbar(
                              message: 'Please fill all fields',
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.red,
                              flushbarPosition: FlushbarPosition.BOTTOM,
                              icon: const Icon(
                                Icons.error_outline,
                                color: Colors.white,
                              ),
                              margin: const EdgeInsets.all(8),
                              borderRadius: BorderRadius.circular(8),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              reverseAnimationCurve: Curves.bounceIn,
                            ).show(context);
                          },
                          icon: const Icon(Icons.delete_outline_outlined),
                        ),
                        title: Text(
                          tododata[getindex].titletask,
                          maxLines: 1,
                          style: TextStyle(
                              decoration: tododata[getindex].isDone
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        subtitle: Text(
                          tododata[getindex].description,
                          maxLines: 2,
                          style: TextStyle(
                              decoration: tododata[getindex].isDone
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        trailing: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                              shape: const CircleBorder(),
                              activeColor: Colors.black,
                              value: tododata[getindex].isDone,
                              onChanged: (value) => ref
                                  .read(serviceProvider)
                                  .updatetask(tododata[getindex].docid, value)),
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
                                  Text(tododata[getindex].datetask),
                                  const Gap(12),
                                  Text(tododata[getindex].timetask)
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(
              child: Text(stackTrace.toString()),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
