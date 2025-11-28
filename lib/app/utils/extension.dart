import 'package:evehicle/app/themes/loading_dialog.dart';
import 'package:evehicle/app/themes/solid_colors.dart';
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
        behavior: .floating,
        shape: RoundedRectangleBorder(borderRadius: .circular(8)),
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

  void showSuccessDialog(String title, String message) {
    showDialog(
      context: this,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: .circular(16)),
        child: Padding(
          padding: const .all(30),
          child: Column(
            mainAxisSize: .min,
            children: [
              Container(
                padding: .all(16),
                decoration: BoxDecoration(
                  color: green300.withValues(),
                  shape: .circle,
                ),
                child: Icon(Icons.check_circle, color: green300, size: 60),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: .bold, color: black),
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: black400),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teal300,
                    foregroundColor: white900,
                    padding: const .symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: .circular(8)),
                  ),
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
