import 'package:flutter/material.dart';

class MytextField extends StatefulWidget {
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
  State<MytextField> createState() => _MytextFieldState();
}

class _MytextFieldState extends State<MytextField> {
  late bool _isObscured;
  @override
  void initState() {
    super.initState();
    _isObscured = widget.obsureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isObscured,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: widget.hinText,
        suffixIcon: widget.obsureText
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
      ),
    );
  }
}
