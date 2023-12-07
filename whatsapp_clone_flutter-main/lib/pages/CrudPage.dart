import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SqliteApp extends StatefulWidget {
  const SqliteApp({Key? key}) : super(key: key);

  @override
  _SqliteAppState createState() => _SqliteAppState();
}

class _SqliteAppState extends State<SqliteApp> {
  int? selectedId;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: Center(
        child: FutureBuilder<List<Contact>>(
          future: DatabaseHelper.instance.getContacts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('Carregando ...'));
            }
            return snapshot.data!.isEmpty
                ? Center(child: Text('Sem Itens Na Lista'))
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var contact = snapshot.data![index];
                      return ListTile(
                        title: Text(contact.name),
                        subtitle: Text('${contact.phone} - ${contact.email}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                setState(() {
                                  nameController.text = contact.name;
                                  phoneController.text = contact.phone;
                                  emailController.text = contact.email;
                                  selectedId = contact.id;
                                });
                                _showEditDialog(context, contact);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Excluir Contato'),
                                      content:
                                          Text('Deseja excluir este contato?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              DatabaseHelper.instance
                                                  .remove(contact.id!);
                                              clearControllers();
                                              selectedId = null;
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text('Excluir'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            nameController.text = contact.name;
                            phoneController.text = contact.phone;
                            emailController.text = contact.email;
                            selectedId = contact.id;
                          });
                        },
                      );
                    },
                  );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Novo Contato'),
                    content: Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(labelText: 'Nome'),
                        ),
                        TextField(
                          controller: phoneController,
                          decoration: InputDecoration(labelText: 'Telefone'),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await DatabaseHelper.instance.add(
                            Contact(
                              name: nameController.text,
                              phone: phoneController.text,
                              email: emailController.text,
                            ),
                          );
                          clearControllers();
                          Navigator.pop(context);
                          setState(() {}); // Atualiza a lista de contatos
                        },
                        child: Text('Salvar'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  void clearControllers() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
  }

  Future<void> _showEditDialog(BuildContext context, Contact contact) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Contato'),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                await DatabaseHelper.instance.update(
                  Contact(
                    id: selectedId,
                    name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                  ),
                );
                clearControllers();
                selectedId = null;
                setState(() {}); // Atualiza a lista de contatos
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}

class Contact {
  final int? id;
  final String name;
  final String phone;
  final String email;

  Contact(
      {this.id, required this.name, required this.phone, required this.email});

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'contacts.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE contacts(
          id INTEGER PRIMARY KEY,
          name TEXT,
          phone TEXT,
          email TEXT
      )
      ''');
  }

  Future<List<Contact>> getContacts() async {
    Database db = await instance.database;
    var contacts = await db.query('contacts', orderBy: 'name');
    return contacts.isNotEmpty
        ? contacts.map((c) => Contact.fromMap(c)).toList()
        : [];
  }

  Future<int> add(Contact contact) async {
    Database db = await instance.database;
    return await db.insert('contacts', contact.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Contact contact) async {
    Database db = await instance.database;
    return await db.update('contacts', contact.toMap(),
        where: "id = ?", whereArgs: [contact.id]);
  }
}
