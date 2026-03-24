import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListaContato(),
  ));
}

// Lista de contatos
class ListaContato extends StatelessWidget {
  final String nome1 = 'Charlo';
  final String telefone1 = '(19) 11111-1111';

  final String nome2 = 'Otávio';
  final String telefone2 = '(19) 22222-2222';

  final String nome3 = 'Douglas';
  final String telefone3 = '(19) 33333-3333';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              leading: ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ligacao1(nome1: nome1))
                );
              }, child: Icon(Icons.phone),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              )),
              title: Text('$nome1'),
              trailing: ElevatedButton(onPressed: () {{}
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contato1(nome1: nome1, telefone1: telefone1,))
                );
              }, child: Text('Ver Detalhes'))
            ),
            ListTile(
              leading: ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ligacao2(nome2: nome2))
                );
              }, child: Icon(Icons.phone),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              )),
              title: Text('$nome2'),
              trailing: ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contato2(nome2: nome2, telefone2: telefone2,))
                );
              }, child: Text('Ver Detalhes'))
            ),
            ListTile(
              leading: ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ligacao3(nome3: nome3))
                );
              }, child: Icon(Icons.phone),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              )),
              title: Text('$nome3'),
              trailing: ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contato3(nome3: nome3, telefone3: telefone3,))
                );
              }, child: Text('Ver Detalhes'))
            ),
          ],
        ),
      ),
    );
  }
}

// Contato 1
class Contato1 extends StatelessWidget {
  final String nome1;
  final String telefone1;

  Contato1({required this.nome1, required this.telefone1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato de $nome1'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Text('👤', style: TextStyle(fontSize: 50,),),
            SizedBox(height: 20),
            Text('$nome1', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            Text('$telefone1', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ligacao1(nome1: nome1))
              );
            }, child: Icon(Icons.phone),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            )),
          ],
        )
      ),
    );
  }
}

// Ligacao 1
class Ligacao1 extends StatelessWidget {
  final String nome1;

  Ligacao1({required this.nome1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato de $nome1'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Text('👤', style: TextStyle(fontSize: 50),),
            SizedBox(height: 20),
            Text('Ligando para $nome1', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Icon(Icons.call_end),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ))
          ],
        )
      ),
    );
  }
}

// Contato 2
class Contato2 extends StatelessWidget {
  final String nome2;
  final String telefone2;

  Contato2({required this.nome2, required this.telefone2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato de $nome2'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            Text('👤', style: TextStyle(fontSize: 50,),),
            SizedBox(height: 20),
            Text('$nome2', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            Text('$telefone2', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ligacao2(nome2: nome2))
              );
            }, child: Icon(Icons.phone),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            )),
          ],
        )
      ),
    );
  }
}

// Ligacao 2
class Ligacao2 extends StatelessWidget {
  final String nome2;

  Ligacao2({required this.nome2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato de $nome2'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            Text('👤', style: TextStyle(fontSize: 50),),
            SizedBox(height: 20),
            Text('Ligando para $nome2', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Icon(Icons.call_end),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ))
          ],
        )
      ),
    );
  }
}

// Contato 3
class Contato3 extends StatelessWidget {
  final String nome3;
  final String telefone3;

  Contato3({required this.nome3, required this.telefone3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato de $nome3'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text('👤', style: TextStyle(fontSize: 50,),),
            SizedBox(height: 20),
            Text('$nome3', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            Text('$telefone3', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ligacao3(nome3: nome3))
              );
            }, child: Icon(Icons.phone),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            )),
          ],
        )
      ),
    );
  }
}

// Ligacao 3
class Ligacao3 extends StatelessWidget {
  final String nome3;

  Ligacao3({required this.nome3});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato de $nome3'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text('👤', style: TextStyle(fontSize: 50),),
            SizedBox(height: 20),
            Text('Ligando para $nome3', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Icon(Icons.call_end),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ))
          ],
        )
      ),
    );
  }
}