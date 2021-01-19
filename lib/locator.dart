import 'package:flutter_todo/core/repositories/todos_repository/todos_repository_impl.dart';
import 'package:flutter_todo/core/services/local_storage/local_storage_service_impl.dart';
import 'package:flutter_todo/core/services/modal/modal_sercive_impl.dart';
import 'package:get_it/get_it.dart';

import 'core/repositories/todos_repository/todos_repository.dart';
import 'core/services/key_storage/key_storage_service.dart';
import 'core/services/key_storage/key_storage_service_impl.dart';
import 'core/services/local_storage/local_storage_service.dart';
import 'core/services/modal/modal_service.dart';
import 'core/services/navigation/navigation_service.dart';
import 'core/services/navigation/navigation_service_impl.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Repositories
  locator.registerLazySingleton<TodosRepository>(() => TodosRepositoryImpl());

  // Services
  locator.registerLazySingleton<NavigationService>(
    () => NavigationServiceImpl(),
  );
  locator.registerLazySingleton<LocalStorageService>(
      () => LocalStorageServiceImpl());

  locator.registerLazySingleton<ModalService>(
      () => ModalServiceImpl());
  await initializeService();
}

Future<void> initializeService() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerSingleton<KeyStorageService>(instance);
}
