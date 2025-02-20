import 'package:flutter/material.dart';

class MytextField extends StatelessWidget {
  final String hinText;
  final bool obsureText;
  final TextEditingController controller;
  const MytextField({
    super.key,
    required this.hinText,
    required this.obsureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hinText,
      ),
      obscureText: true,
    );
  }
}
