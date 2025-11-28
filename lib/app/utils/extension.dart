import 'package:flutter/material.dart';

enum StatusState { initial, loading, success, failure }

extension StatusStateExtension on StatusState {
  bool get isInitial => this == StatusState.initial;
  bool get isLoading => this == StatusState.loading;
  bool get isSuccess => this == StatusState.success;
  bool get isFailure => this == StatusState.failure;
}

extension BuildContextExtension on BuildContext {
  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
