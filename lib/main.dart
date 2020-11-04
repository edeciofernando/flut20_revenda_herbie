import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:revenda_herbie/carros_bloc.dart';
//import 'package:revenda_herbie/api_carros.dart';
//import 'package:revenda_herbie/home_page.dart';
import 'package:revenda_herbie/login_page.dart';

void main() {
//  ApiCarros apicarros = ApiCarros();
//  apicarros.getCarros();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => CarrosBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoginPage(),
      ),
    );
  }
}
