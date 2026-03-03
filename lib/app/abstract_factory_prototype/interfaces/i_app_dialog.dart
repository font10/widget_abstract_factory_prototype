import 'package:flutter/material.dart';

abstract class IAppDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const IAppDialog({super.key, required this.title, required this.content, required this.actions});

  // Método Prototipo
  IAppDialog clone({String? title, String? content, List<Widget>? actions});
}