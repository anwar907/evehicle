import 'package:evehicle/app/modules/splash/view/splash_view.dart';
import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white900,
      body: SafeArea(
        child: Padding(
          padding: const .all(24),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Icon(Icons.error_outline, size: 120, color: context.black400),
              const SizedBox(height: 32),
              Text(
                'Oops!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: .bold,
                  color: context.black,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Something went wrong',
                style: TextStyle(fontSize: 18, color: context.black400),
                textAlign: .center,
              ),
              const SizedBox(height: 8),
              Text(
                'Please try again',
                style: TextStyle(fontSize: 14, color: context.black400),
                textAlign: .center,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const SplashScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.teal300,
                    foregroundColor: context.white900,
                    padding: const .symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: .circular(12)),
                  ),
                  child: const Text(
                    'Refresh',
                    style: TextStyle(fontSize: 16, fontWeight: .bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
