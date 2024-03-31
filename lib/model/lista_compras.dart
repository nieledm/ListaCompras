class ListaCompras {
  final String item;
  final double quantidade;
  final String medida;
  bool comprado;

  ListaCompras(this.item, this.quantidade, this.medida,
      {this.comprado = false});
}
