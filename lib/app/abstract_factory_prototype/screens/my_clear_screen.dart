import 'package:flutter/material.dart';
import '../factories/ui_factory.dart';

class MyCleanScreen extends StatelessWidget {
  final UIFactory uiFactory;
  const MyCleanScreen({required this.uiFactory, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clean Arch UI')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Creamos los componentes sin saber la plataforma
              uiFactory.createTextField(placeholder: 'Ingresa tu nombre'),
              const SizedBox(height: 20),
              uiFactory.createButton(
                text: 'Enviar',
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                onPressed: () => print('Enviado!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}