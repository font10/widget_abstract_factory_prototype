import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/dialog/material_app_dialog.dart';

void main() {
  group('AppDialog Tests (Unitarios)', () {
    test('MaterialAppDialog clone debe mantener las acciones y actualizar el título', () {
      final actions = [TextButton(onPressed: () {}, child: const Text('OK'))];

      final original = MaterialAppDialog(
        title: 'Error',
        content: 'Algo salió mal',
        actions: actions,
      );

      // Clonamos cambiando solo el título
      final clon = original.clone(title: 'Atención');

      expect(clon.title, 'Atención');
      expect(clon.content, 'Algo salió mal');
      expect(clon.actions, actions); // Mantiene las mismas acciones
    });
  });
}