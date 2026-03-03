import 'package:flutter/material.dart';
import 'package:widgets_abstract_factory/app/abstract_factory_prototype/screens/my_clear_screen.dart';
import 'app/abstract_factory_prototype/factories/ui_factory_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final uiFactory = UIFactoryProvider.getFactory(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyCleanScreen(uiFactory: uiFactory),
    );
  }
}



