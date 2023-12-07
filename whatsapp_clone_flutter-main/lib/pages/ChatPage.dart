import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/ChatBottomBar.dart';
import '../widgets/ChatSample.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(top: 10, left: 5),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 25,
              ),
            ),
          ),
          leadingWidth: 20,
          title: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "images/profile1.jpg",
                    height: 45,
                    width: 45,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Programer",
                        style: TextStyle(fontSize: 19),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "online",
                        style: TextStyle(
                            fontSize: 15, color: Colors.white.withOpacity(.8)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 10, right: 25),
              child: Icon(
                CupertinoIcons.video_camera_solid,
                size: 35,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 25),
              child: Icon(
                Icons.call,
                size: 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 10),
              child: Icon(
                Icons.more_vert,
                size: 28,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 20,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFFFF3C2),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Text(
                  "O WhatsApp utiliza uma tecnologia de criptografia de ponta a ponta para proteger as mensagens enviadas por seus usuários.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ChatSample(),
              
            ],
          ),
        ),

      ),
      bottomSheet: ChatBottomBar(),
    );
  }
}
