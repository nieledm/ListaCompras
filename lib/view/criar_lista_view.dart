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
  List<String> listaDeOpcoes = ['Lista 1', 'Lista 2', 'Lista 3'];

  // Valor selecionado no dropdown
  String dropdownValue = 'Lista 1';

  // Lista temporária para armazenar as listas cadastradas
  List<String> listasCadastradas = [];

  // Chave global para o formulário
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas de compras'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'lib/imagens/ListaCompras3.PNG',
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              'Listas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white, // Fundo branco
                border: Border.all(
                    color: Colors.grey.withOpacity(0.5)), // Borda cinza claro
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                elevation: 0, // Sem sombra
                isExpanded: true, // Ocupa toda a largura disponível
                style: TextStyle(
                  color: Colors.black, // Texto preto
                  fontSize: 18,
                ),
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
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
                    child: Text(
                      value,
                      style: TextStyle(
                        backgroundColor: Colors.white, // Fundo branco
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 80),
            Text(
              'Cadastrar nova lista de compras',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Form(
              key: formKey,
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
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Adiciona o nome da nova lista à lista temporária
                  listasCadastradas.add(txtValor1.text);

                  // Atualiza a lista de opções do dropdown
                  setState(() {
                    listaDeOpcoes.add(txtValor1.text);
                    dropdownValue = txtValor1.text;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Lista cadastrada com sucesso!'),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  // Limpar o campo de texto
                  txtValor1.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(37, 28, 23, 0),
                foregroundColor: Color.fromARGB(255, 253, 253, 253),
                minimumSize: Size(150, 55),
              ),
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Fecha a tela atual
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(37, 28, 23, 0),
                foregroundColor: Color.fromARGB(255, 253, 253, 253),
                minimumSize: Size(150, 55),
              ),
              child: Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
