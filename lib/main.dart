// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:listacompras/view/esqueceu_senha_view.dart';
import 'package:listacompras/view/cadastrar_view.dart';
import 'package:listacompras/view/sobre_view.dart';
import 'package:listacompras/view/criar_lista_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Compras ',
      home: PrincipalView(),
    );
  }
}

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  //
  // Atributos
  //

  // Identificador do formulário
  var formKey = GlobalKey<FormState>();

  // Controladores dos campos de texto
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                //imagem

                Image.asset(
                  'lib/imagens/ListaCompras3.PNG',
                  width: 80,
                  height: 200,
                ),
                //
                // CAMPO DE TEXTO
                //
                TextFormField(
                  controller: txtValor1,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  //
                  // Validação
                  //
                  validator: (value) {
                    if (value == null) {
                      return 'Informe um email válido';
                    } else if (value.isEmpty) {
                      return 'Informe um email válido';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Informe um e-mail válido';
                    }
                    //RETORNAR NULL SIGNIFICA QUE O CAMPO FOI VALIDADO COM SUCESSO
                    return null;
                  },
                ),

                SizedBox(height: 30),

                TextFormField(
                  controller: txtValor2,
                  style: TextStyle(fontSize: 18),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  //
                  // Validação
                  //

                  /*#########################################################
                  validator: (value) {
                    if (value == null) {
                      return 'Informe uma senha válida';
                    } else if (value.isEmpty) {
                      return 'Informe uma senha válida';
                    }
                    //RETORNAR NULL SIGNIFICA QUE O CAMPO FOI VALIDADO COM SUCESSO
                    return null;
                  },
                  #########################################################*/
                ),

                SizedBox(height: 30),
                //
                // BOTÃO
                //
                //TextButton(
                //OutlinedButton(
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(37, 28, 23, 0),
                    foregroundColor: Color.fromARGB(255, 253, 253, 253),
                    minimumSize: Size(150, 55),
                  ),
                  onPressed: () {
                    //
                    // CHAMAR OS VALIDADORES
                    //
                    /*#########################################################
                    ###########################################################*/

                    // Retornar o ifif (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CriarListaView()),
                    );
                    // OS CAMPOS FORAM VALIDADOS

                    /*
                      //Recuperar as informações dos campos de texto

                      setState(() {
                        //Retornar o conteúdo do campo Valor 1
                        double v1 = double.parse(txtValor1.text);
                        //Retornar o conteúdo do campo Valor 2
                        double v2 = double.parse(txtValor2.text);
                        double resultado = v1 + v2;

                        //exibir resultado
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Resultado: $resultado'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      });
                      */
                    // Retornar o if}
                  },
                  child: Text('Login', style: TextStyle(fontSize: 18)),
                ),

                //Botão esqueceu senha

                SizedBox(height: 10),

                TextButton(
                  style: TextButton.styleFrom(
                    shadowColor: Color.fromARGB(37, 28, 23, 0),
                    //minimumSize: Size(200, 40),
                  ),

                  //Botão esqueceu a senha
                  //Mudar para levar a uma tela
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EsqueceuSenhaView()),
                    );
                  },
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),

                //Botão cadastrar

                SizedBox(height: 10),

                TextButton(
                  style: TextButton.styleFrom(
                    shadowColor: Color.fromARGB(37, 28, 23, 0),
                    //minimumSize: Size(200, 40),
                  ),

                  //Mudar para levar a uma tela
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CadastrarView(),
                      ),
                    );
                  },
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),

                Spacer(),

                //Botão sobre
                SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                    shadowColor: Color.fromARGB(37, 28, 23, 0),
                    //minimumSize: Size(200, 40),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SobreView()),
                    );
                  },
                  child: Text(
                    'Sobre',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
