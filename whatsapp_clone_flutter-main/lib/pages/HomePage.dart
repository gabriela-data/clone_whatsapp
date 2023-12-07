import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/pages/CrudPage.dart';
import 'package:whatsapp_clone_flutter/widgets/CallsWidget.dart';
import 'package:whatsapp_clone_flutter/widgets/Camera.dart';
import 'package:whatsapp_clone_flutter/widgets/ChatsWidget.dart';
import 'package:whatsapp_clone_flutter/widgets/StatusWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "WhatsApp",
                style: TextStyle(fontSize: 21),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 12, right: 15),
                child: Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
              PopupMenuButton(
                elevation: 10,
                padding: EdgeInsets.symmetric(vertical: 20),
                iconSize: 28,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      "Novo Grupo",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      "Nova Transmissão",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Text(
                      "Dispositivos vinculados",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 4,
                    child: Text(
                      "Mensagens Favoritas",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 5,
                    child: Text(
                      "Configurações",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Color(0xFF075E55),
              child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.white,
                indicatorWeight: 4,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                tabs: [
                  Container(
                    width: 24,
                    child: Tab(
                      icon: Icon(Icons.camera_alt),
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Text("Conversas"),
                        SizedBox(width: 8),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "10",
                            style: TextStyle(
                              color: Color(0xFF075E55),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Text("Status"),
                  ),
                  Tab(
                    child: Text("Chamadas"),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: TabBarView(
                children: [
                  PickImage(), // Tab 1 - Câmera
                  ChatsWidget(), // Tab 2 - Conversas
                  StatusWidget(), // Tab 3 - Status
                  CallsWidget(), // Tab 4 - Chamadas
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SqliteApp()),
            );
          },
          backgroundColor: Color(0xFF075E55),
          child: Icon(Icons.person_add),
        ),
      ),
    );
  }
}
