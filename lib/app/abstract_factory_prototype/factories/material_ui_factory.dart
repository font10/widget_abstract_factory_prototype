import 'dart:ui';

import 'package:flutter/src/widgets/editable_text.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/factories/ui_factory.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/interfaces/i_app_textfield.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/textfield/material_app_textfield.dart';

import '../interfaces/i_app_button.dart';
import '../widgets/buttons/material_app_button.dart';

class MaterialUIFactory implements UIFactory {
  // Mantenemos una instancia prototipo en memoria
  final IAppButton _buttonPrototype = const MaterialAppButton(text: 'prototype');
  final IAppTextField _textFieldPrototype = const MaterialAppTextField(placeholder: 'prototype');

  @override
  IAppButton createButton({required String text, Color? backgroundColor, Color? textColor, VoidCallback? onPressed}) {
    // Clonamos el prototipo con los nuevos datos
    return _buttonPrototype.clone(text: text, backgroundColor: backgroundColor, textColor: textColor, onPressed: onPressed);
  }

  @override
  IAppTextField createTextField({required String placeholder, TextEditingController? controller}) {
    // Clonamos el prototipo con los nuevos datos
    return _textFieldPrototype.clone(placeholder: placeholder, controller: controller);
  }
}
