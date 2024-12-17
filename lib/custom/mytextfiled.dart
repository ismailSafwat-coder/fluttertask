// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Mytextfiled extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final IconData? icon;

  const Mytextfiled({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value == '') {
            return '$hintText can\'t be null';
          }
          return null;
        },
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon),
            border: const OutlineInputBorder()));
  }
}
