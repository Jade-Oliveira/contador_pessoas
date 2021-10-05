import 'package:flutter/material.dart';

void main() {
  //função que precisa para rodar a aplicação e é do tipo material app para suportar widgets do tipo material design
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      //parâmetros opcionais do materialApp
      title: 'Contador de Pessoas',
      //tela inicial do nosso app
      home: Home()));
}

//criamos um widget que possui um stado interno que no caso é o _HomeState
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = 'Pode entrar!';

  //função para modificar número de pessoas
  void _changePeople(int delta) {
    //uso o setState para informar o flutter que haverá uma mudança aqui
    //chama o build para redesenhar a tela com a variável _people modificada nesse caso
    //não refaz a tela inteira apenas as partes que foram modificadas
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = 'Mundo invertido?!';
      } else if (_people <= 10) {
        _infoText = 'Pode entrar!';
      } else {
        _infoText = 'Lotado!';
      }
    });
  }

  //a função build é chamada sempre que queremos modificar alguma coisa no layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/restaurant.jpg',
            fit: BoxFit.cover,
            height: 1000,
          ),
          Column(
            //alinhamento do eixo principal
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pessoas: $_people',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextButton(
                        onPressed: () {
                          _changePeople(1);
                        },
                        child: Text('+1',
                            style:
                                TextStyle(fontSize: 48, color: Colors.white))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextButton(
                        onPressed: () {
                          _changePeople(-1);
                        },
                        child: Text('-1',
                            style:
                                TextStyle(fontSize: 48, color: Colors.white))),
                  ),
                ],
              ),
              Text(
                _infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
