import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AppCompras()));
}

class AppCompras extends StatefulWidget {
  @override
  _AppComprasState createState() => _AppComprasState();
}

class _AppComprasState extends State<AppCompras> {
  List<String> itens = [];
  List<bool> comprado = [];
  TextEditingController controller = TextEditingController();

  void salvarDados() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList("itens", itens);
    prefs.setStringList("comprado", comprado.map((e) => e.toString()).toList());
  }

  void carregarDados() async {
    final prefs = await SharedPreferences.getInstance();

    itens = prefs.getStringList("itens") ?? [];
    List<String> listaBool = prefs.getStringList("comprado") ?? [];

    comprado = listaBool.map((e) => e == "true").toList();

    setState(() {});
  }

  void adicionarItem() {
    if (controller.text.isNotEmpty) {
      setState(() {
        itens.add(controller.text);
        comprado.add(false);
        controller.clear();
      });
      salvarDados();
    }
  }

  void alternarComprado(int index) {
    setState(() {
      comprado[index] = !comprado[index];
    });
    salvarDados();
  }

  void removerItem(int index) {
    setState(() {
      itens.removeAt(index);
      comprado.removeAt(index);
    });
    salvarDados();
  }

  void limparLista() {
    setState(() {
      itens.clear();
      comprado.clear();
    });
    salvarDados();
  }

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    int total = itens.length;
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Compras")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Digite um item",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(onPressed: adicionarItem, child: Text("Adicionar")),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: limparLista, child: Text("Limpar lista")),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Total de itens: $total"),
          ),
          Expanded(
            child: itens.isEmpty
                ? Center(child: Text("Nenhum item"))
                : ListView.builder(
                    itemCount: itens.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          itens[index],
                          style: TextStyle(
                            decoration: comprado[index]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: comprado[index] ? Colors.grey : Colors.black,
                          ),
                        ),
                        onTap: () => alternarComprado(index),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removerItem(index),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
