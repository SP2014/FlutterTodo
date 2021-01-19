import 'package:flutter/material.dart';
import 'package:flutter_todo/core/enums/view_state.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  bool _disposed = true;

  void setState(ViewState viewState) {
    _state = viewState;

    if (!_disposed) return;

    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = false;
    super.dispose();
  }
}
