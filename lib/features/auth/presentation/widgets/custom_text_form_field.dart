import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onSaved,
    required this.validator,
    this.obscureText,
  });

  final String? hintText;
  final void Function(String?)? onSaved;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
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
        errorStyle: TextStyle(color: theme.colorScheme.error, fontSize: 12),
        
      ),
      onSaved: onSaved,
      obscureText: obscureText ?? false,
      validator: validator,
    );
  }
}
