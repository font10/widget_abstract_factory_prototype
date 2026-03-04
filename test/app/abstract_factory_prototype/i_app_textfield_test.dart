import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/textfield/cupertino_app_textfield.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/textfield/material_app_textfield.dart';

void main() {
  group('AppTextField Tests (Unitarios)', () {
    test(
      'MaterialAppTextField debe gestionar placeholder y controller correctamente',
      () {
        final myController = TextEditingController(text: 'Valor inicial');

        // Setup: Como lo usarías en una pantalla
        final original = MaterialAppTextField(
          placeholder: 'Escribe algo...',
          controller: myController,
        );

        // Verificación
        expect(original.placeholder, 'Escribe algo...');
        expect(original.controller?.text, 'Valor inicial');

        // Verificación de clonación manteniendo el estado del controlador
        final clon = original.clone(placeholder: 'Nuevo placeholder');

        expect(clon.placeholder, 'Nuevo placeholder');
        expect(
          clon.controller,
          myController,
        ); // ¡La misma instancia! Vital para no perder el texto
      },
    );

    test('CupertinoAppTextField debe clonar correctamente', () {
      const original = CupertinoAppTextField(placeholder: 'User');

      final clon = original.clone(placeholder: 'Password');

      expect(clon.placeholder, 'Password');
      expect(clon.controller, isNull);
    });
  });
}
