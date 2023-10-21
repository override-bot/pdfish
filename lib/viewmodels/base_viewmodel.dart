import 'package:flutter/material.dart';

class BaseViewmodel extends ChangeNotifier {
  int _currentIndex = 0;
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  void setBusy(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setError(String message) {
    _error = message;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  void handleException(dynamic exception) {
    setError('An error occurred: $exception');
  }
}
