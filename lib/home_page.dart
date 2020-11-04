import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:revenda_herbie/carro.dart';
import 'package:revenda_herbie/carros_bloc.dart';
import 'package:revenda_herbie/item_lista.dart';
import 'package:revenda_herbie/menu_pesquisa.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = BlocProvider.getBloc<CarrosBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text('Revenda Herbie'),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () async {
              _bloc.buscaCarrosDestaque();
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String pesq =
                  await showSearch(context: context, delegate: MenuPesquisa());
              //print(pesq);
              if (pesq != null) {
                _bloc.buscaCarrosPesquisa(pesq);
              }
            },
          ),
        ],
      ),
      body: _body(context),
    );
  }

  Column _body(context) {
    _bloc.buscaCarrosDestaque();

    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder<List<Carro>>(
            stream: _bloc.outCarros,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Erro ao acessar Servidor',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                    ),
                  ),
                );
              }

              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.data.isEmpty) {
                return Center(
                  child: Text(
                    'Não há veículos deste modelo',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                    ),
                  ),
                );
              }

              return ListView.builder(
                itemBuilder: (context, index) {
                  return ItemLista(snapshot.data[index]);
                },
                itemCount: snapshot.data.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
