import 'package:evehicle/app/themes/loading_dialog.dart';
import 'package:flutter/material.dart';

enum StatusState { initial, loading, success, failure }

extension StatusStateExtension on StatusState {
  bool get isInitial => this == StatusState.initial;
  bool get isLoading => this == StatusState.loading;
  bool get isSuccess => this == StatusState.success;
  bool get isFailure => this == StatusState.failure;
}

extension BuildContextExtension on BuildContext {
  void showLoadingDialog() {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) => LoadingDialog(),
    );
  }

  void showErrorDialog(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.white,
          onPressed: () => ScaffoldMessenger.of(this).hideCurrentSnackBar(),
        ),
      ),
    );
  }

  void dismissDialog() {
    Navigator.pop(this);
  }
}
