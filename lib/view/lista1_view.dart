// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Lista1View extends StatelessWidget {
  Lista1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista 1'),
      ),
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(50, 100, 50, 0), // Ajuste do padding no topo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Ajuste do alinhamento
          crossAxisAlignment: CrossAxisAlignment
              .center, // Centraliza os elementos horizontalmente
          children: [
            Image.asset(
              'lib/imagens/ListaCompras3.PNG',
              width: 80,
              height: 200,
            ),
            SizedBox(height: 20), // Espaçamento entre os botões
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(37, 28, 23, 0),
                foregroundColor: Color.fromARGB(255, 253, 253, 253),
              ),
              onPressed: () {
                // VOLTAR PARA A TELA 1
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
