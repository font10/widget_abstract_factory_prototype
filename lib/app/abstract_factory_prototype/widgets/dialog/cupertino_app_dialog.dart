import 'package:flutter/cupertino.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/interfaces/i_app_dialog.dart';

class CupertinoAppDialog extends IAppDialog {
  const CupertinoAppDialog({super.key, required super.title, required super.content, required super.actions});

  @override
  IAppDialog clone({String? title, String? content, List<Widget>? actions}) =>
      CupertinoAppDialog(title: title ?? this.title, content: content ?? this.content, actions: actions ?? this.actions);

  @override
  Widget build(BuildContext context) => CupertinoAlertDialog(
    title: Text(title),
    content: Text(content),
    actions: actions,
  );
}