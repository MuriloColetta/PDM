import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: JogoApp(),
  ));
}

class JogoApp extends StatefulWidget {
  @override
  _JogoAppState createState() => _JogoAppState();
}

class _JogoAppState extends State<JogoApp> {
  IconData iconeComputador = Icons.computer;

  String resultado = 'Escolha uma opção';

  int pontosJogador = 0;
  int pontosComputador = 0;

  List opcao = ['pedra', 'papel', 'tesoura'];

  void jogar(String escolhaUsuario) {
    var numero = Random().nextInt(3);
    var escolhaComputador = opcao[numero];

    setState(() {
      if(escolhaUsuario == escolhaComputador) {
        resultado = 'Empate';
      } else if (
        (escolhaUsuario == "pedra" && escolhaComputador == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaComputador == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaComputador == "papel")
      ) {
        pontosJogador++;
        resultado = "Você venceu!";
      } else {
        pontosComputador++;
        resultado = 'Computador venceu!';
      }

      fimDeJogo();
    });
  }

  void fimDeJogo() {
    setState(() {
      if (pontosJogador == 5) {
        resultado = "🏆 Você ganhou o campeonato!";
        pontosComputador = 0;
        pontosJogador = 0;
      } else if (pontosComputador == 5) {
        resultado = '🏆 Computador ganhou o campeonato!';
        pontosComputador = 0;
        pontosJogador = 0;
      }
    });
  }

  void resetarPlacar() {
    setState(() {
      pontosComputador = 0;
      pontosJogador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    String pedra = '🪨';
    String papel = '📃';
    String tesoura ='✂️';

    return Scaffold(
      appBar: AppBar(
        title: Text('Pedra Papel Tesoura'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Computador'),
            Icon(
              iconeComputador,
              size: 100,
            ),
            Text(
              resultado,
              style: TextStyle(fontSize: 26),
            ),
            Text(
              "Você: $pontosJogador | PC: $pontosComputador",
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => jogar('pedra'),
                  child: Text(pedra),
                ),
                ElevatedButton(
                  onPressed: () => jogar("papel"),
                  child: Text(papel)
                ),
                ElevatedButton( 
                  onPressed: () => jogar("tesoura"),
                  child: Text(tesoura)
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: resetarPlacar,
              icon: Icon(Icons.refresh),
              label: Text("Resetar Placar"),
            )
          ],
        ),
      ),
    );
  }
}