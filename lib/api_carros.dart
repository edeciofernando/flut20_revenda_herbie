import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:revenda_herbie/carro.dart';

class ApiCarros {
  final url =
      'https://api.sheety.co/cc39b81cc0de334bde702335753e051b/revendaHerbieNoite/carros';

  // getCarros() async {
  //   var response = await http.get(url);
  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //   print(json.decode(response.body)['carros']);
  // }

  getCarros() async {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var lista = json.decode(response.body)['carros'];
      List<Carro> carros =
          lista.map<Carro>((carro) => Carro.fromJson(carro)).toList();
      // print(carros);
      return carros;
    } else {
      throw Exception('Erro ao acessar WebService');
    }
  }

  getCarrosDestaque() async {
    var response = await http.get(url + '?filter[destaque]=true');

    if (response.statusCode == 200) {
      var lista = json.decode(response.body)['carros'];
      List<Carro> carros =
          lista.map<Carro>((carro) => Carro.fromJson(carro)).toList();
      // print(carros);
      return carros;
    } else {
      throw Exception('Erro ao acessar WebService');
    }
  }

  getCarrosPesquisa(String palavra) async {
    var response = await http.get(url + '?filter[modelo]=' + palavra);

    if (response.statusCode == 200) {
      var lista = json.decode(response.body)['carros'];
      List<Carro> carros =
          lista.map<Carro>((carro) => Carro.fromJson(carro)).toList();
      // print(carros);
      return carros;
    } else {
      throw Exception('Erro ao acessar WebService');
    }
  }
}
