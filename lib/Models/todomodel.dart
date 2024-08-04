import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todomodel {
  String? docid;
  final String titletask;
  final String description;
  final String category;
  final String datetask;
  final String timetask;
  final bool isDone;
  Todomodel({
    this.docid,
    required this.titletask,
    required this.description,
    required this.category,
    required this.datetask,
    required this.timetask,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docid': docid,
      'titletask': titletask,
      'description': description,
      'category': category,
      'datetask': datetask,
      'timetask': timetask,
      'isDone': isDone,
    };
  }

  factory Todomodel.fromMap(Map<String, dynamic> map) {
    return Todomodel(
      docid: map['docid'] != null ? map['docid'] as String : null,
      titletask: map['titletask'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      datetask: map['datetask'] as String,
      timetask: map['timetask'] as String,
      isDone: map['isDone'] as bool,
    );
  }
  factory Todomodel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Todomodel(
        docid: doc.id,
        titletask: doc['titletask'],
        description: doc['description'],
        category: doc['category'],
        datetask: doc['datetask'],
        timetask: doc['timetask'],
        isDone: doc['isDone']);
  }
}
