import 'package:flutter/material.dart';
import 'package:howabout_coffee/app/core/ui/styles/text_styles.dart';

import '../ui/styles/color_app.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool validate;
  final String validatorText;
  final String? labelText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.validatorText = '',
    this.validate = true,
    this.labelText,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (widget.labelText != null)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.labelText ?? '',
                  style: context.textStyles.textMedium.copyWith(
                    color: ColorsApp.instance.fontColor,
                    fontSize: 20,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        TextFormField(
          validator: (!widget.validate) ? null : (val) => val!.isEmpty ? widget.validatorText : null,
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.grey[500])),
        ),
      ],
    );
  }
}
