// Interfaz abstracta para nuestro Textfield (Prototype)
import 'package:flutter/material.dart';

abstract class IAppTextField extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;

  const IAppTextField({super.key, required this.placeholder, this.controller});

  IAppTextField clone({String? placeholder, TextEditingController? controller});
}