import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HumorApp()
  ));
}

class HumorApp extends StatefulWidget {
  @override
  _HumorAppState createState() => _HumorAppState();
}

class _HumorAppState extends State<HumorApp> {
  int humor = 0;

  void alternarHumor() {
    setState(() {
      if (humor < 2) {
        humor++;
      } else {
        humor = 0;
      }
    });
  } 

  @override
  Widget build(BuildContext context) {
    Color appbar;
    Color fundo;
    String emoji;
    String humorAtual;

    if (humor == 0) {
      appbar = Colors.orangeAccent;
      fundo = Colors.yellow;
      emoji = '😀';
      humorAtual = 'Feliz';
    } 
    else if (humor == 1) {
      appbar = Colors.blueGrey;
      fundo = Colors.grey;
      emoji = '😐';
      humorAtual = 'Neutro';
    } 
    else {
      appbar = Colors.red;
      fundo = Colors.orangeAccent;
      emoji = '😡';
      humorAtual = 'Bravo';
    }

    return Scaffold(
      backgroundColor: fundo,
      appBar: AppBar(
        title: Text("Mudança de Humor"),
        backgroundColor: appbar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: TextStyle(fontSize: 80)
            ),
            Text(
              humorAtual,
              style: TextStyle(fontSize: 80)
            ),
            ElevatedButton(
              onPressed: alternarHumor,
              child: Text('Mudar Humor')
            )
          ],
        ),
      ),
    );
  }
}