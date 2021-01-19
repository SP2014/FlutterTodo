import 'package:flutter_todo/core/enums/view_state.dart';
import 'package:flutter_todo/core/exceptions/repository_exception.dart';
import 'package:flutter_todo/core/models/todos/todos.dart';
import 'package:flutter_todo/core/repositories/todos_repository/todos_repository.dart';
import 'package:flutter_todo/core/view_models/base_view_model.dart';

import '../../locator.dart';

class MainViewModel extends BaseViewModel{
  final _todosRepository = locator<TodosRepository>();
  List<Todos> _todos = [];
  List<Todos> get todos => _todos;

  Future<void> init() async{
    setState(ViewState.Busy);
    try{
      final fetchedTodos = await _todosRepository.fetchTodos();
      _todos = fetchedTodos.toList();
    } on RepositoryException catch(e){
      print(e);
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);
  }

  void addData(Todos todos){
    _todosRepository.addTodos(todos);
    _todos.add(todos);
    notifyListeners();
  }

  void deleteTodos(int id){
    _todosRepository.deleteTodos(id);
    _todos.removeWhere((todos) => todos.id == id);
    notifyListeners();
  }
}