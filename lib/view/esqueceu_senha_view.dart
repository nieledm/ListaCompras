// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class EsqueceuSenhaView extends StatelessWidget {
  EsqueceuSenhaView({Key? key}) : super(key: key);

  // Controlador do campo de texto
  final TextEditingController txtValor1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esqueceu a senha?'),
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
            SizedBox(height: 20),
            Text(
              'Informe o email cadastrado',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: txtValor1,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe um email válido';
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Informe um endereço de e-mail válido';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(37, 28, 23, 0),
                    foregroundColor: Color.fromARGB(255, 253, 253, 253),
                  ),
                  onPressed: () {
                    if (txtValor1.text.isEmpty ||
                        //expressão regular (regex) que verifica se o valor
                        //inserido no campo de texto corresponde a um endereço de e-mail válido
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(txtValor1.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Por favor, informe um email válido'),
                        ),
                      );
                    } else {
                      // Exibir o SnackBar com a mensagem de aviso
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Uma mensagem será enviada ao email cadastrado'),
                        ),
                      );
                      // Voltar para a tela anterior após um breve intervalo
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: Text('Enviar'),
                ),
                SizedBox(width: 20), // Espaçamento entre os botões
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
          ],
        ),
      ),
    );
  }
}
