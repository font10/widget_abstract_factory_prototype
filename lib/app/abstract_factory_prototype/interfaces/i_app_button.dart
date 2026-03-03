// Interfaz abstracta para nuestro Botón (Prototype)
import 'package:flutter/material.dart';

abstract class IAppButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const IAppButton({
    super.key,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.onPressed,
  });

  // El contrato del Prototype
  IAppButton clone({String? text, Color? backgroundColor, Color? textColor, VoidCallback? onPressed});
}
