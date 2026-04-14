import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AppCadastro()));
}

class AppCadastro extends StatefulWidget {
  @override
  _AppCadastroState createState() => _AppCadastroState();
}

class _AppCadastroState extends State<AppCadastro> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  List<Map<String, dynamic>> dados = [];

  int? idEditando;

  Future<Database> criarBanco() async {
    final caminho = await getDatabasesPath();
    final path = join(caminho, 'banco.db');

    return openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE dados(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, descricao TEXT, data TEXT)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE dados ADD COLUMN data TEXT');
        }
      },
    );
  }

  Future<void> inserirDados(String titulo, String descricao) async {
    final db = await criarBanco();

    String dataAtual = DateTime.now().toIso8601String();

    await db.insert('dados', {
      'titulo': titulo,
      'descricao': descricao,
      'data': dataAtual,
    });

    carregarDados();
  }

  Future<void> carregarDados() async {
    final db = await criarBanco();
    final lista = await db.query('dados', orderBy: 'titulo ASC');

    setState(() {
      dados = lista;
    });
  }

  Future<void> deletarDados(int id) async {
    final db = await criarBanco();
    await db.delete('dados', where: 'id = ?', whereArgs: [id]);
    carregarDados();
  }

  Future<void> atualizarDados(int id, String titulo, String descricao) async {
    final db = await criarBanco();

    await db.update(
      'dados',
      {
        'titulo': titulo,
        'descricao': descricao,
      },
      where: 'id = ?',
      whereArgs: [id],
    );

    carregarDados();
  }

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastros')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: tituloController,
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (tituloController.text.isNotEmpty &&
                  descricaoController.text.isNotEmpty) {
                if (idEditando == null) {
                  inserirDados(
                    tituloController.text,
                    descricaoController.text,
                  );
                } else {
                  atualizarDados(
                    idEditando!,
                    tituloController.text,
                    descricaoController.text,
                  );
                  idEditando = null;
                }
                tituloController.clear();
                descricaoController.clear();
                setState(() {});
              }
            },
            child: Text(idEditando == null ? 'Adicionar' : 'Atualizar'),
          ),
          if (idEditando != null)
            TextButton(
              onPressed: () {
                setState(() {
                  idEditando = null;
                  tituloController.clear();
                  descricaoController.clear();
                });
              },
              child: Text('Cancelar edição'),
            ),
          Expanded(
            child: dados.isEmpty
                ? Center(
                    child: Text(
                      'Nenhum item cadastrado',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: dados.length,
                    itemBuilder: (context, index) {
                      final item = dados[index];
                      final data = item['data'] != null
                          ? DateTime.tryParse(item['data'])
                          : null;

                      return ListTile(
                        title: Text(item['titulo']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['descricao']),
                            if (data != null)
                              Text(
                                '${data.day.toString().padLeft(2, '0')}/'
                                '${data.month.toString().padLeft(2, '0')}/'
                                '${data.year} '
                                '${data.hour.toString().padLeft(2, '0')}:'
                                '${data.minute.toString().padLeft(2, '0')}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            tituloController.text = item['titulo'];
                            descricaoController.text = item['descricao'];
                            idEditando = item['id'];
                          });
                        },
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deletarDados(item['id']);
                          },
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