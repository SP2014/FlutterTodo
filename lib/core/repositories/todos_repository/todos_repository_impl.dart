import 'package:flutter_todo/core/models/todos/todos.dart';
import 'package:flutter_todo/core/models/todos/todos_h.dart';
import 'package:flutter_todo/core/repositories/todos_repository/todos_repository.dart';
import 'package:flutter_todo/core/services/local_storage/local_storage_service.dart';
import 'package:flutter_todo/locator.dart';

class TodosRepositoryImpl implements TodosRepository{
  final _localStorageService = locator<LocalStorageService>();

  @override
  Future<List<Todos>> fetchTodos() async{
    final todos = _fetchTodosLocally();
    return todos;
  }

  List<Todos> _fetchTodosLocally(){
    if(_localStorageService.todosBox == null || _localStorageService.todosBox.isEmpty){

    }

    return _localStorageService.todosBox.values
            .cast<TodosH>()
            .map((todosH) => Todos.fromMap(todosH.toMap()))
            .toList();
  }

  // Future<void> _storeTodosLocally(List<Todos> todos) async{
  //   final todosMap = <int,TodosH>{};
  //   todos.forEach((todos) => todosMap.addAll({todos.id: TodosH.fromTodos(todos)}));

  //   await _localStorageService.todosBox.putAll(todosMap);
  // }

  @override
  void addTodos(Todos todos) async{
    final todosMap = <int, TodosH>{};
    todosMap.addAll({todos.id: TodosH.fromTodos(todos)});
    await _localStorageService.todosBox.putAll(todosMap);
  }

  @override
  void deleteTodos(int id){
    _localStorageService.todosBox.delete(id);
  }
  
}