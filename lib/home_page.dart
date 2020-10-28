import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:revenda_herbie/carro.dart';
import 'package:revenda_herbie/carros_bloc.dart';
import 'package:revenda_herbie/item_lista.dart';
import 'package:revenda_herbie/menu_pesquisa.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Image.asset('assets/logo.png'),
          height: 25,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MenuPesquisa());
            },
          ),
        ],
      ),
      body: _body(context),
    );
  }

  Column _body(context) {
    final bloc = BlocProvider.getBloc<CarrosBloc>();
    bloc.buscaDados();

    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder<List<Carro>>(
              stream: bloc.outCarros,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemLista(snapshot.data[index]);
                    },
                    itemCount: snapshot.data.length,
                  );
                } else {
                  return Container();
                }
              }),
        ),
      ],
    );
  }
}
