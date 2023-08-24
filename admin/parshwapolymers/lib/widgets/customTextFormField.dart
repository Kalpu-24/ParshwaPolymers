// ignore_for_file: file_names

import 'package:flutter/material.dart';

TextFormField customTextFormField({
  required context,
  required String label,
  required TextEditingController controller,
  required String validator,
}) {
  return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validator;
        }
        return null;
      },
      cursorColor: const Color(0xff5075b2),
      decoration: InputDecoration(
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xff5075b2)),
      ));
}
