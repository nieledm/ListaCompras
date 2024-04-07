import 'package:flutter/material.dart';
import '../model/lista_compras.dart';

class ListaView extends StatefulWidget {
  final String title;
  final List<ListaCompras> dados;

  ListaView({Key? key, required this.title, required this.dados})
      : super(key: key);

  @override
  _ListaViewState createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  // Controladores dos campos
  TextEditingController nomeController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
  TextEditingController unidadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              // lógica para editar o nome da lista
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              // lógica para deletar a lista
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
            // Adicione aqui a barra de pesquisa
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
                    // lógica para pesquisar itens na lista
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
                itemCount: widget.dados.length,
                itemBuilder: (context, index) {
                  return _buildListItem(widget.dados[index]);
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
            // VOLTAR PARA 1 TELA
            Navigator.pop(context);
          },
          child: Text('Voltar'),
        ),
      ),
    );
  }

  Widget _buildListItem(ListaCompras item) {
    return ListTile(
      leading: Checkbox(
        value: item.comprado,
        onChanged: (value) {
          setState(() {
            item.comprado = value ?? false;
          });
        },
      ),
      title: Text(item.item),
      subtitle: Text('${item.quantidade} ${item.medida}'),
      trailing: PopupMenuButton<String>(
        onSelected: (String result) {
          if (result == 'editar') {
            //_editarItem(context, item);
          } else if (result == 'deletar') {
            setState(() {
              widget.dados.remove(item);
            });
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
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
  }

  void _adicionarItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Adicionar Item',
            style: TextStyle(color: Colors.black), // Cor preta para o título
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Item',
                  labelStyle:
                      TextStyle(color: Colors.black), // Cor preta para o label
                ),
              ),
              TextFormField(
                controller: quantidadeController,
                decoration: InputDecoration(
                  labelText: 'Quantidade',
                  labelStyle:
                      TextStyle(color: Colors.black), // Cor preta para o label
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: unidadeController,
                decoration: InputDecoration(
                  labelText: 'Unidade',
                  labelStyle:
                      TextStyle(color: Colors.black), // Cor preta para o label
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
}*/
}
