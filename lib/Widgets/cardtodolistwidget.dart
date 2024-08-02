import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Cardtodolistwidget extends StatelessWidget {
  const Cardtodolistwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
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
                  title: const Text('Learning Flutter'),
                  subtitle: const Text('Learning Provider State Mangement '),
                  trailing: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                        shape: const CircleBorder(),
                        activeColor: Colors.black,
                        value: false,
                        onChanged: (value) => print(value)),
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
                        const Row(
                          children: [
                            Text('Toady'),
                            Gap(12),
                            Text('9:15 pm - 11:45 pm')
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
  }
}
