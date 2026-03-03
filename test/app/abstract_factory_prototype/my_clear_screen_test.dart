// test/features/auth/login_screen_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/factories/ui_factory.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/interfaces/i_app_button.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/interfaces/i_app_textfield.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/screens/my_clear_screen.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/buttons/material_app_button.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/textfield/material_app_textfield.dart';

class MockUIFactory implements UIFactory {
  bool buttonCreated = false;
  bool textFieldCreated = false;

  @override
  IAppButton createButton({required String text, Color? backgroundColor, Color? textColor, VoidCallback? onPressed}) {
    buttonCreated = true;
    return const MaterialAppButton(text: 'Mock'); // Retornamos un widget dummy
  }

  @override
  IAppTextField createTextField({required String placeholder, TextEditingController? controller}) {
    textFieldCreated = true;
    return MaterialAppTextField(placeholder: 'Mock');
  }
}

// test/features/my_clean_screen_test.dart
void main() {
  testWidgets('La pantalla debe solicitar componentes a la fábrica inyectada', (WidgetTester tester) async {
    // 1. Arrange (Preparamos el escenario)
    final mockFactory = MockUIFactory();

    // 2. Act (Lanzamos el widget)
    await tester.pumpWidget(
      MaterialApp(
        home: MyCleanScreen(uiFactory: mockFactory),
      ),
    );

    // 3. Assert (Verificamos)
    expect(mockFactory.buttonCreated, isTrue);
    expect(mockFactory.textFieldCreated, isTrue);

    // Opcional: Verificar que el texto está ahí
    expect(find.text('Clean Arch UI'), findsOneWidget);
  });

  testWidgets('La pantalla solicita el TextField con el placeholder correcto', (WidgetTester tester) async {
    // Arrange
    final mockFactory = MockUIFactory();

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: MyCleanScreen(uiFactory: mockFactory),
      ),
    );

    // Assert
    expect(mockFactory.textFieldCreated, isTrue);

    // AQUÍ ESTÁ LA MAGIA: Verificamos que el texto sea el esperado
    expect(mockFactory.textFieldCreated, 'Ingresa tu nombre');
  });
}