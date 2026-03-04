import 'package:flutter/material.dart';

import '../../interfaces/i_app_button.dart';

class MaterialAppButton extends IAppButton {
  const MaterialAppButton({
    super.key,
    required super.text,
    super.backgroundColor,
    super.textColor,
    super.onPressed,
  });

  @override
  IAppButton clone({
    String? text,
    Color? backgroundColor,
    Color? textColor,
    VoidCallback? onPressed,
  }) {
    return MaterialAppButton(
      text: text ?? this.text,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      onPressed: onPressed ?? this.onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(text, style: TextStyle(color: textColor ?? Colors.white)),
    );
  }
}
