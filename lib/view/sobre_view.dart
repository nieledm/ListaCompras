// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SobreView extends StatelessWidget {
  const SobreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/imagens/ListaCompras3.PNG',
              width: 80,
              height: 200,
            ),
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Tema: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Lista de Compras\n\n',
                  ),
                  TextSpan(
                    text: 'Objetivo: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        'O objetivo do aplicativo é oferecer uma ferramenta prática e eficiente para criar e gerenciar listas de compras de forma organizada e intuitiva.\n\n',
                  ),
                  TextSpan(
                    text: 'Desenvolvedor: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Niele Dias Mendes',
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(width: 20),
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
            Spacer(),
          ],
        ),
      ),
    );
  }
}
