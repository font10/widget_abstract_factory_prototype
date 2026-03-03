import 'package:flutter/material.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/interfaces/i_app_textfield.dart';
import '../interfaces/i_app_button.dart';

abstract class UIFactory {
  IAppButton createButton({required String text, Color? backgroundColor, Color? textColor, VoidCallback? onPressed});
  IAppTextField createTextField({required String placeholder, TextEditingController? controller});
}