import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:revenda_herbie/carro.dart';

class ItemLista extends StatelessWidget {
  final Carro carro;

  ItemLista(this.carro);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Image.network(carro.foto),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(carro.marca + ' ' + carro.modelo),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                          'Preço ${NumberFormat.simpleCurrency(locale: 'pt_BR').format(carro.preco)}'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
