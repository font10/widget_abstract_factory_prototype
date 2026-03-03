import 'package:flutter/material.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/factories/ui_factory.dart';

import 'cupertino_ui_factory.dart';
import 'material_ui_factory.dart';

class UIFactoryProvider {
  static UIFactory getFactory(BuildContext context) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return CupertinoUIFactory();
    }

    return MaterialUIFactory();
  }
}