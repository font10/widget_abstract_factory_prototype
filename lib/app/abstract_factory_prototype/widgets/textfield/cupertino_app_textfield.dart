import 'package:flutter/cupertino.dart';
import '../../interfaces/i_app_textfield.dart';

class CupertinoAppTextField extends IAppTextField {
  const CupertinoAppTextField({super.key, required super.placeholder, super.controller});

  @override
  IAppTextField clone({String? placeholder, TextEditingController? controller}) =>
      CupertinoAppTextField(placeholder: placeholder ?? this.placeholder, controller: controller ?? this.controller);

  @override
  Widget build(BuildContext context) => CupertinoTextField(placeholder: placeholder, controller: controller);
}