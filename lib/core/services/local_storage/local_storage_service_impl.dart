import 'package:flutter_todo/core/constants/local_storage_keys.dart';
import 'package:flutter_todo/core/models/todos/todos_h.dart';
import 'package:flutter_todo/core/services/local_storage/local_storage_service.dart';
import 'package:hive/hive.dart';
import '../../utils/file_utils.dart' as file_utils;

class LocalStorageServiceImpl implements LocalStorageService{
  Box<TodosH> _todosBox;
  Box<TodosH> get todosBox => _todosBox;

  Future<void> init() async{
    try{
      final path = await file_utils.getApplicationDocumentsDirectoryPath();
      Hive.init(path);

      Hive.registerAdapter(TodosHAdapter(), 0);
    } on HiveError catch (e){
      print(e);
    }

    _todosBox = await Hive.openBox<TodosH>(LocalStorageKeys.todos);
  }
}