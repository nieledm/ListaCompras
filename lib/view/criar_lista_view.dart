import 'package:flutter/material.dart';
import 'lista1_view.dart'; // Importe a tela Lista1View

class CriarListaView extends StatefulWidget {
  CriarListaView({Key? key}) : super(key: key);

  @override
  _CriarListaViewState createState() => _CriarListaViewState();
}

class _CriarListaViewState extends State<CriarListaView> {
  // Controlador do campo de texto
  final TextEditingController txtValor1 = TextEditingController();

  // Lista de opções para o dropdown
  final List<String> listaDeOpcoes = ['Lista 1', 'Lista 2', 'Lista 3'];

  // Valor selecionado no dropdown
  String dropdownValue = 'Lista 1';

  // Chave global para o formulário
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/imagens/ListaCompras3.PNG',
                width: 80,
                height: 200,
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                  // Verifica se o novo valor selecionado é "Lista 1" e navega para Lista1View
                  if (newValue == 'Lista 1') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Lista1View()),
                    );
                  }
                },
                items:
                    listaDeOpcoes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Spacer(),
              SizedBox(height: 20),
              Text(
                'Deseja cadastrar uma nova lista de compras?',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: txtValor1,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Nome da nova lista de compras',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe o nome de uma nova lista';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(37, 28, 23, 0),
                      foregroundColor: Color.fromARGB(255, 253, 253, 253),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Implemente a lógica de cadastro aqui
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Lista cadastrada com sucesso!'),
                          ),
                        );
                        // Limpar o campo de texto
                        txtValor1.clear();
                      }
                    },
                    child: Text('Cadastrar'),
                  ),
                ],
              ),
              Spacer(),
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
        ),
      ),
    );
  }
}
