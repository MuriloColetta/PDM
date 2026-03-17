import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TemperaturaApp()
  ));
}

class TemperaturaApp extends StatefulWidget {
  @override
  _TemperaturaAppState createState() => _TemperaturaAppState();
}

class _TemperaturaAppState extends State<TemperaturaApp> {
  int temperatura = 20;

  void aumentar() {
    setState(() {
      temperatura++;
    });
  }

  void diminuir() {
    setState(() {
      temperatura--;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color corFundo;
    String icone;
    String status;

    if (temperatura < 15) {
      corFundo = Colors.lightBlue;
      icone = '❄️';
      status = "Frio ";
    }
    else if (temperatura < 30) {
      corFundo = Colors.lightGreen;
      icone = '😎';
      status = "Agradável ";
    }
    else {
      corFundo = Colors.redAccent;
      icone = '🔥';
      status = "Quente ";
    }

    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(
        title: Text('Controle de Temperatura'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$temperatura °C",
              style: TextStyle(fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Text(
                status,
                style: TextStyle(fontSize: 30),
                ),
                Text(
                  icone,
                  style: TextStyle(fontSize: 60),
                )
              ]
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: diminuir, child: Icon(Icons.remove)
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: aumentar, child: Icon(Icons.add)
                )
              ],
            )
          ]
        )
      ),
    );
  }
}