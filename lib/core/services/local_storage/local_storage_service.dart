import 'package:flutter_todo/core/models/todos/todos_h.dart';
import 'package:hive/hive.dart';

abstract class LocalStorageService{
  Future<void> init();
  Box<TodosH> get todosBox;
}