import 'package:flutter/material.dart';
import '../model/lista_compras.dart'; // Importe a classe ListaCompras

class Lista1View extends StatefulWidget {
  Lista1View({Key? key}) : super(key: key);

  @override
  _Lista1ViewState createState() => _Lista1ViewState();
}

class _Lista1ViewState extends State<Lista1View> {
  // Lista Dinâmica de objetos da classe ListaCompras
  List<ListaCompras> dados = [];

  // Controlador dos campos
  TextEditingController nomeController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
  TextEditingController unidadeController = TextEditingController();

  @override
  void initState() {
    dados.add(ListaCompras('Feijão', 1, 'kg', comprado: false));
    dados.add(ListaCompras('Maçã', 3, 'unidades', comprado: false));
    dados.add(ListaCompras('Sabonete', 3, 'barras', comprado: false));
    dados.add(ListaCompras('Arroz', 5, 'kg', comprado: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista 1'),
        actions: [
          IconButton(
            onPressed: () {
              // Adicione aqui a lógica para editar a lista
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              // Adicione aqui a lógica para deletar a lista
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'lib/imagens/ListaCompras3.PNG',
                    width: 80,
                    height: 80,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Pesquisar',
                      hintText: 'Pesquisar item...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Adicione aqui a lógica para pesquisar itens na lista
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: Color.fromARGB(37, 28, 23, 0),
                    foregroundColor: Color.fromARGB(255, 253, 253, 253),
                  ),
                  child: Icon(Icons.search),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Item',
                      labelStyle:
                          TextStyle(fontSize: 14), // Tamanho da fonte ajustado
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: quantidadeController,
                    decoration: InputDecoration(
                      labelText: 'Qtd',
                      labelStyle:
                          TextStyle(fontSize: 14), // Tamanho da fonte ajustado
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: unidadeController,
                    decoration: InputDecoration(
                      labelText: 'Uni',
                      labelStyle:
                          TextStyle(fontSize: 14), // Tamanho da fonte ajustado
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Verifica se o campo de nome está vazio
                    if (nomeController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Erro'),
                            content:
                                Text('Por favor, insira um nome para o item.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Adicione aqui a lógica para adicionar o item à lista
                      String nome = nomeController.text;
                      double quantidade =
                          double.tryParse(quantidadeController.text) ?? 0.0;
                      String unidade = unidadeController.text;
                      setState(() {
                        dados.add(ListaCompras(nome, quantidade, unidade));
                      });
                      nomeController.clear();
                      quantidadeController.clear();
                      unidadeController.clear();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: Color.fromARGB(37, 28, 23, 0),
                    foregroundColor: Color.fromARGB(255, 253, 253, 253),
                  ),
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: dados.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: dados[index].comprado,
                      onChanged: (value) {
                        setState(() {
                          dados[index].comprado = value ?? false;
                        });
                      },
                    ),
                    title: Text(dados[index].item),
                    subtitle: Text(
                      '${dados[index].quantidade} ${dados[index].medida}',
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (String result) {
                        if (result == 'deletar') {
                          setState(() {
                            dados.removeAt(index);
                          });
                        }
                        // Adicione aqui a lógica para editar o item
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'editar',
                          child: ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Editar Item'),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'deletar',
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('Deletar Item'),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Adicione aqui a lógica para selecionar o item ao ser clicado
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
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
      ),
    );
  }
}
