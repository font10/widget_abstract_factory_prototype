// test/app/ui/factories/ui_factory_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/factories/cupertino_ui_factory.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/factories/material_ui_factory.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/buttons/cupertino_app_button.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/buttons/material_app_button.dart';

void main() {
  test('MaterialUIFactory debe retornar MaterialAppButton', () {
    final factory = MaterialUIFactory();
    final button = factory.createButton(text: 'Test');

    expect(button, isA<MaterialAppButton>());
  });

  test('CupertinoUIFactory debe retornar CupertinoAppButton', () {
    final factory = CupertinoUIFactory();
    final button = factory.createButton(text: 'Test');

    expect(button, isA<CupertinoAppButton>());
  });
}