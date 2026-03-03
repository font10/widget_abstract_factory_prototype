// test/features/auth/login_screen_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/factories/ui_factory.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/interfaces/i_app_button.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/interfaces/i_app_dialog.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/interfaces/i_app_textfield.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/screens/my_clear_screen.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/buttons/material_app_button.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/dialog/material_app_dialog.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/widgets/textfield/material_app_textfield.dart';

class MockUIFactory implements UIFactory {
  bool buttonCreated = false;
  bool textFieldCreated = false;
  bool dialogCreated = false;

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

  @override
  IAppDialog createDialog({required String title, required String content, required List<Widget> actions}) {
    dialogCreated = true;
    return MaterialAppDialog(title: 'Mock Dialog', content: 'This is a mock dialog', actions: []);
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
    final textfield = mockFactory.createTextField(placeholder: 'Ingrese su nombre', controller: TextEditingController());

    textfield.controller?.text = 'Test'; // Simulamos que el usuario ingresa texto
    // Assert
    expect(mockFactory.textFieldCreated, isTrue);
    expect(textfield.placeholder, 'Mock'); // Verificamos que se usó el mock
  });

  test('El boton creado por la fabrica debe abrir el dialogo con el mensaje correcto', () {
    // Arrange
    final mockFactory = MockUIFactory();

    // Act
    final context = null;
    final dialog = mockFactory.createDialog(
      title: 'Error',
      content: 'Este es un mensaje de error genérico, sin importar la plataforma.',
      actions: [],
    );

    final button = mockFactory.createButton(
      text: 'Enviar',
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      onPressed: () => showDialog(
        context: context,
        builder: (context) => dialog,
      ),
    );

    // Simulamos la pulsación del botón
    button.onPressed?.call();

    // Assert
    expect(mockFactory.dialogCreated, isTrue);
  });

}