import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo/core/services/modal/modal_service.dart';

class ModalServiceImpl implements ModalService{
  final _modalNavigationKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get modalNavigationKey => _modalNavigationKey;

  Function() _showModalListener;
  Completer<Map<String, dynamic>> _modalCompleter;

  @override
  void registerModalListener(Function() showModalListener){
    _showModalListener = showModalListener;
  }

  @override
  Future<Map<String, dynamic>> showModalSheet(){
    _modalCompleter = Completer<Map<String, dynamic>>();

    _showModalListener();
    return _modalCompleter.future;
  }



  @override
  void modelComplete(Map<String, dynamic> response) {
    _modalNavigationKey.currentState.pop();
    _modalCompleter.complete(response);
    _modalCompleter = null;
  }
}