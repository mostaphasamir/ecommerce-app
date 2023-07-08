import 'package:flutter/material.dart';

import '../../core/constance/app_color.dart';

Widget defaultTTF({
  required TextEditingController controller,
  required String labelText,
  required String hintText,
  Widget? suffixIcon,
  bool obscureText = false,
  required String? Function(String?)? validator,
  required context,
}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        cursorColor: AppColor.black,
        style: Theme.of(context).textTheme.displayMedium,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labelText,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          hintStyle: const TextStyle(color: AppColor.gray),
          labelStyle:
              TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: AppColor.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: AppColor.primary),
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
