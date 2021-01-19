import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'todos.g.dart';

abstract class Todos implements Built<Todos, TodosBuilder>{
  int get id;
  String get task;
  String get category;
  String get timestamp;

  static Todos fromMap(Map<String, dynamic> map){
    return serializers.deserializeWith(
      Todos.serializer,
      map
    );
  }

  Todos._();
  static Serializer<Todos> get serializer => _$todosSerializer;
  factory Todos([void Function(TodosBuilder) updates]) = _$Todos;

}