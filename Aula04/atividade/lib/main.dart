import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TodoPage());
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});
  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<String> item = [];
  final TextEditingController controller = TextEditingController();

  void adicionarTarefa() {
    if (controller.text.isNotEmpty) {
      setState(() {
        item.add(controller.text);
      });
    }
    controller.clear();
  }

  void removerTarefa(int index) {
    setState(() {
      item.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Tarefas: ${item.length}")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            onSubmitted: (value) => adicionarTarefa(),
          ),
          ElevatedButton(
            onPressed: adicionarTarefa,
            child: const Text("Adicionar"),
          ),
          Expanded(
            child: item.isEmpty
            ? const Center(
              child: Text("Nenhuma tarefa adicionada"),
            )
            : ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(item[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => removerTarefa(index),
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