import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:listacompras/view/principal_view.dart'; // Importando PrincipalView

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras ',
      home: PrincipalView(), // Usando PrincipalView como tela inicial
    );
  }
}
