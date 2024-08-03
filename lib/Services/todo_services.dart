import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/Models/todomodel.dart';

class TodoServices {
  final todoCollection = FirebaseFirestore.instance.collection('TodoApp');

  //CRUD

  //Create
  void addtodo(Todomodel todo) {
    todoCollection.add(todo.toMap());
  }
}
