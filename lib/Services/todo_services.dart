import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/Models/todomodel.dart';

class TodoServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addtodo(Todomodel todo) async {
    await _firestore.collection('TodoApp').add(todo.toMap());
  }

  Future<void> updateTask(Todomodel todo) async {
    try {
      await _firestore
          .collection('TodoApp')
          .doc(todo.docid)
          .update(todo.toMap());
    } catch (e) {
      print('Error updating task: $e');
    }
  }

  Future<void> deletetask(String? docid) async {
    if (docid != null) {
      await _firestore.collection('TodoApp').doc(docid).delete();
    }
  }
}
