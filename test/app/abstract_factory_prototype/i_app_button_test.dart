// test/core/ui/widgets/button/app_button_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/buttons/cupertino_app_button.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/buttons/material_app_button.dart';
import 'package:flutter/material.dart';

void main() {
  group('AppButton Tests (Unitarios)', () {
    test(
      'MaterialAppButton debe asignar parámetros y clonar manteniendo valores',
      () {
        // Setup: Pasamos los parámetros como en la UI
        const original = MaterialAppButton(
          text: 'Guardar',
          backgroundColor: Colors.blue,
        );

        // Verificación de parámetros iniciales
        expect(original.text, 'Guardar');
        expect(original.backgroundColor, Colors.blue);

        // Verificación del prototipo (clone)
        final clon = original.clone(text: 'Actualizar');

        expect(clon.text, 'Actualizar'); // Cambió
        expect(clon.backgroundColor, Colors.blue); // Mantuvo el color
      },
    );

    test('CupertinoAppButton debe funcionar igual', () {
      void callback() => debugPrint('Click');
      final original = CupertinoAppButton(text: 'Hola', onPressed: callback);

      final clon = original.clone(text: 'Adiós');

      expect(clon.text, 'Adiós');
      expect(
        clon.onPressed,
        callback,
      ); // Verificamos la referencia de la función
    });
  });
}
