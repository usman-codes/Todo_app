import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Models/todomodel.dart';
import 'package:todo_app/Services/todo_services.dart';

final serviceProvider = StateProvider<TodoServices>((ref) {
  return TodoServices();
});

final fetchstreamProvider = StreamProvider<List<Todomodel>>((ref) async* {
  final getdata = FirebaseFirestore.instance
      .collection('TodoApp')
      .snapshots()
      .map((event) => event.docs
          .map((snapshot) => Todomodel.fromSnapshot(snapshot))
          .toList());
  yield* getdata;
});
