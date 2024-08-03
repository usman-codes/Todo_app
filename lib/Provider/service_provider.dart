import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/Services/todo_services.dart';

final serviceProvider = StateProvider<TodoServices>((ref) {
  return TodoServices();
});
