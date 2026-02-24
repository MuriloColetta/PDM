import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: NumeroAleatorio()));
}

class NumeroAleatorio extends StatefulWidget{
  @override
  _NumeroAleatorioState createState() => _NumeroAleatorioState();
}

class _NumeroAleatorioState extends State<NumeroAleatorio>{
  int numero = 0;

  void sortear(){
    setState(() {
      numero = Random().nextInt(10) + 1;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Meu App Interativo")),
      body: Center(
        child: Text("Número sorteado: $numero",
        style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sortear,
        child: Icon(Icons.casino),
      ),
    );
  }
}