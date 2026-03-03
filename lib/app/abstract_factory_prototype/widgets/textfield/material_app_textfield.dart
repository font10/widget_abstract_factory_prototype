import 'package:flutter/material.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/interfaces/i_app_textfield.dart';

class MaterialAppTextField extends IAppTextField {
  const MaterialAppTextField({super.key, required super.placeholder, super.controller});

  @override
  IAppTextField clone({String? placeholder, TextEditingController? controller}) =>
      MaterialAppTextField(placeholder: placeholder ?? this.placeholder, controller: controller ?? this.controller);

  @override
  Widget build(BuildContext context) => TextField(
    decoration: InputDecoration(hintText: placeholder),
    controller: controller,
  );
}
