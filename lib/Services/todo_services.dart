import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/Models/todomodel.dart';

class TodoServices {
  final todoCollection = FirebaseFirestore.instance.collection('TodoApp');

  //CRUD

  //Create
  void addtodo(Todomodel todo) {
    todoCollection.add(todo.toMap());
  }

  //UPDATE RADIO BUTTON
  void updatetask(String? docid, bool? valueupdate) {
    todoCollection.doc(docid).update({'isDone': valueupdate});
  }

  //DELETE
  void deletetask(String? docid) {
    todoCollection.doc(docid).delete();
  }
    // Edit
  Future<void> edittodo(String docId, Todomodel updatedTodo) async {
    try {
      await todoCollection.doc(docId).update(updatedTodo.toMap());
    } catch (e) {
      print("Error updating todo: $e");
    }
  }

}
