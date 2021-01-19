import 'package:flutter_todo/core/models/todos/todos.dart';
import 'package:hive/hive.dart';

part 'todos_h.g.dart';

@HiveType()
class TodosH extends HiveObject{
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String task;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final String timestamp;

  TodosH({
    this.id,
    this.task,
    this.category,
    this.timestamp
  });

  factory TodosH.fromTodos(Todos todos){
    return TodosH(
      id: todos.id,
      task: todos.task,
      category: todos.category,
      timestamp: todos.timestamp
    );
  }

  factory TodosH.fromMap(Map<String, dynamic> map){
    return TodosH(
      id: map['id'],
      task: map['task'],
      category: map['category'],
      timestamp: map['timestamp']
    );
  }

  Map<String, dynamic> toMap(){
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['task'] = task;
    map['category'] = category;
    map['timestamp'] = timestamp;
    return map;
  }
}