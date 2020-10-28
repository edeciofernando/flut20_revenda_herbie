import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:revenda_herbie/api_carros.dart';
import 'package:revenda_herbie/carro.dart';

class CarrosBloc extends BlocBase {
  final _carrosController = StreamController<List<Carro>>();
  Stream<List<Carro>> get outCarros => _carrosController.stream;

  void buscaDados() async {
    ApiCarros apiCarros = ApiCarros();

    final carros = await apiCarros.getCarros();
    _carrosController.sink.add(carros);
  }

  @override
  void dispose() {
    _carrosController.close();
  }
}
