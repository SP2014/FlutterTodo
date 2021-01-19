import 'package:flutter/material.dart';

abstract class ModalService {
  GlobalKey<NavigatorState> get modalNavigationKey;

  void registerModalListener(Function() showModalListener);

  Future<Map<String, dynamic>> showModalSheet();

  void modelComplete(Map<String, dynamic> response);
}