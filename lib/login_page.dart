import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _quadroSuperior(context),
          _formLogin(context),
        ],
      ),
    );
  }

  _quadroSuperior(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final quadro = Container(
      height: size.height * 0.40,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color.fromRGBO(12, 11, 87, 1.0),
          //Color.fromRGBO(75, 11, 3, 1.0),
          Color.fromRGBO(113, 13, 79, 1.0),
        ]),
      ),
    );

    final balao = Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.06),
      ),
    );

    return Stack(
      children: <Widget>[
        quadro,
        Positioned(child: balao, left: 30, top: 120),
        Positioned(child: balao, right: 10, top: 40),
        Positioned(child: balao, right: 30, top: 140),
        Positioned(child: balao, left: 50, top: 40),
        Positioned(child: balao, left: 150, top: 10),
        Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                height: 42,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Revenda Herbie',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _formLogin(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180,
            ),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Login do Cliente',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                _campoEmail(),
                _campoSenha(),
                _botaoEntrar()
              ],
            ),
          )
        ],
      ),
    );
  }

  _campoEmail() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.alternate_email,
            color: Colors.blue,
          ),
          labelText: 'E-mail do Cliente:',
        ),
      ),
    );
  }

  _campoSenha() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 40),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock_open,
            color: Colors.blue,
          ),
          labelText: 'Senha de Acesso:',
        ),
      ),
    );
  }

  _botaoEntrar() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
        child: Text('Entrar'),
      ),
      onPressed: () {},
    );
  }
}
