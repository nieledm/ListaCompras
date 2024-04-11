// ignore_for_file: prefer_const_constructors

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
            ElevatedButton(
              onPressed: () {
                _adicionarItem(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(37, 28, 23, 0),
                foregroundColor: Color.fromARGB(255, 253, 253, 253),
              ),
              child: Text('Adicionar Item'),
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
                        } else if (result == 'editar') {
                          setState(() {
                            nomeController.clear();
                            quantidadeController.clear();
                            unidadeController.clear();

                            nomeController.text = dados[index].item;
                            quantidadeController.text = dados[index].quantidade.toString();
                            unidadeController.text = dados[index].medida;
                            _editarItem(context, index);
                          });
                        }

                        // ELSE = LÓGICA PARA EDITAR ITEM
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
                      // lógica para selecionar o item ao ser clicado
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

/*#######################################################
ADICIONAR ITEM
#######################################################*/
  void _adicionarItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Adicionar Item',
            style: TextStyle(color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Item',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              TextFormField(
                controller: quantidadeController,
                decoration: InputDecoration(
                  labelText: 'Quantidade',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: unidadeController,
                decoration: InputDecoration(
                  labelText: 'Unidade',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
              ),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
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
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(37, 28, 23, 0),
                foregroundColor: Color.fromARGB(255, 253, 253, 253),
              ),
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

/*#######################################################
EDITAR ITEM
#######################################################*/
  void _editarItem(BuildContext context, index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Editar Item',
            style: TextStyle(color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Item',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              TextFormField(
                controller: quantidadeController,
                decoration: InputDecoration(
                  labelText: 'Quantidade',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: unidadeController,
                decoration: InputDecoration(
                  labelText: 'Unidade',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
              ),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Adicione aqui a lógica para adicionar o item à lista
                String nome = nomeController.text;
                double quantidade =
                    double.tryParse(quantidadeController.text) ?? 0.0;
                String unidade = unidadeController.text;
                setState(() {
                  dados[index] = (ListaCompras(nome, quantidade, unidade));
                });
                nomeController.clear();
                quantidadeController.clear();
                unidadeController.clear();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(37, 28, 23, 0),
                foregroundColor: Color.fromARGB(255, 253, 253, 253),
              ),
              child: Text('Editar'),
            ),
          ],
        );
      },
    );
  }
}

/*#######################################################
EDITAR ITEM
#######################################################*/
/*
void _editarItem(BuildContext context, ListaCompras item) {
  TextEditingController nomeController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
  TextEditingController unidadeController = TextEditingController();

  nomeController.text = item.item;
  quantidadeController.text = item.quantidade.toString();
  unidadeController.text = item.medida;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Editar Item',
          style: TextStyle(color: Colors.black), // Cor preta para o título
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Item',
                labelStyle: TextStyle(color: Colors.black), // Cor preta para o label
              ),
            ),
            TextFormField(
              controller: quantidadeController,
              decoration: InputDecoration(
                labelText: 'Quantidade',
                labelStyle: TextStyle(color: Colors.black), // Cor preta para o label
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: unidadeController,
              decoration: InputDecoration(
                labelText: 'Unidade',
                labelStyle: TextStyle(color: Colors.black), // Cor preta para o label
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
            ),
            child: Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              // Atualiza os detalhes do item na lista
              setState(() {
                item.item = nomeController.text;
                item.quantidade = double.tryParse(quantidadeController.text) ?? 0.0;
                item.medida = unidadeController.text;
              });
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(37, 28, 23, 0),
              foregroundColor: Color.fromARGB(255, 253, 253, 253),
            ),
            child: Text('Salvar'),
          ),
        ],
      );
    },
  );
}
*/

