import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AppNotas(),));
}

class AppNotas extends StatefulWidget {
  @override
  _AppNotasState createState() _AppNotasState();
}

class _AppNotasState extends State<AppNotas> {
  List<String> notas = [];
  TextEditingController controller = TextEditingController();

  void salvarNotas() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('notas', notas);
  }

  void AdicionarNota() {
    if (controller.text.isNotEmpty) {
      setState(() {
        notas.add(controller.text);
        controller.clear();
      });
    }
  }
}