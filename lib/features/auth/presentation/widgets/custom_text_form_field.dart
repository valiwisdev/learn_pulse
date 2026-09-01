

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hintText, this.onSaved, this.obscureText});

  final String? hintText;
  final void Function(String?)? onSaved;
  final bool? obscureText;

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: theme.colorScheme.primary.withValues(alpha: 0.6),
        ),
        filled: true,
        fillColor: theme.colorScheme.surfaceContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: .none,
        ),
      ),
      onSaved: onSaved,
      obscureText: obscureText ?? false,
    );
  }
}
