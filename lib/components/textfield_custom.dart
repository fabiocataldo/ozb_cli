// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextfieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscure;

  const TextfieldCustom({
    Key? key,
    required this.controller,
    required this.label,
    required this.obscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16.0),
        ),
        obscureText: obscure,
      ),
    );
  }
}
