import 'package:flutter_todo/core/models/todos/todos.dart';

abstract class TodosRepository {
  Future<List<Todos>> fetchTodos();
  void addTodos(Todos todos);
  void deleteTodos(int id);

}