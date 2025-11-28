import 'dart:convert';

import 'package:evehicle/app/helpers/shared_preference.dart';
import 'package:evehicle/app/themes/solid_colors.dart';
import 'package:evehicle/app/utils/extension.dart';
import 'package:flutter/material.dart';

void showRentForm(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final pickupController = TextEditingController();
  final contactController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      child: Padding(
        padding: const .all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Rental Interest',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: .bold,
                      color: context.teal300,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    padding: .zero,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  labelText: 'Preferred Start Date',
                  hintText: 'YYYY-MM-DD',
                  border: OutlineInputBorder(borderRadius: .circular(8)),
                  prefixIcon: const Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter start date';
                  }
                  return null;
                },
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    dateController.text = date.toString().split(' ')[0];
                  }
                },
                readOnly: true,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: pickupController,
                decoration: InputDecoration(
                  labelText: 'Pickup Area',
                  hintText: 'Enter pickup location',
                  border: OutlineInputBorder(borderRadius: .circular(8)),
                  prefixIcon: const Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pickup area';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: contactController,
                decoration: InputDecoration(
                  labelText: 'Contact',
                  hintText: 'Phone or email',
                  border: OutlineInputBorder(borderRadius: .circular(8)),
                  prefixIcon: const Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter contact';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final save = {
                        'date': dateController.text,
                        'pickup': pickupController.text,
                        'contact': contactController.text,
                      };

                      PreferenceHelper.instance.setString(
                        'rental_interest',
                        json.encode(save),
                      );
                      Navigator.pop(context);
                      context.showSuccessDialog(
                        'Success!',
                        'Your rental interest has been submitted. We will contact you soon.',
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.teal300,
                    foregroundColor: context.white900,
                    padding: const .symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: .circular(8)),
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
