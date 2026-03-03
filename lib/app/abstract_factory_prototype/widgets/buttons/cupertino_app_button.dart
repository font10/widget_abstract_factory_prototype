import 'package:flutter/cupertino.dart';
import '../../interfaces/i_app_button.dart';

class CupertinoAppButton extends IAppButton {
  const CupertinoAppButton({
    super.key,
    required super.text,
    super.backgroundColor,
    super.textColor,
    super.onPressed,
  });

  @override
  IAppButton clone({String? text, Color? backgroundColor, Color? textColor, VoidCallback? onPressed}) {
    return CupertinoAppButton(
      text: text ?? this.text,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      onPressed: onPressed ?? this.onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      color: backgroundColor,
      child: Text(text, style: TextStyle(color: textColor ?? CupertinoColors.white)),
    );
  }
}