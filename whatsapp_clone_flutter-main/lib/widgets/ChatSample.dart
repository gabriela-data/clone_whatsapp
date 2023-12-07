import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatSample extends StatelessWidget {
  final String receivedMessage = "Olá, tudo bem? Me manda o CEP do Senai";
  final String sentMessage = "Tudo sim, baby! e você como está? Irei mandar";
  final String cepMessage = "42700-000"; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 80),
          child: ClipPath(
            clipper: UpperNipMessageClipperTwo(MessageType.receive),
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                receivedMessage,
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(top: 20, left: 80, bottom: 15),
          child: ClipPath(
            clipper: UpperNipMessageClipperTwo(MessageType.send),
            child: GestureDetector(
              onTap: () {
                launchMaps("42700-000"); 
              },
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFE4FDCA),
                ),
                child: Text(
                  sentMessage,
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(top: 20, left: 80, bottom: 15),
          child: ClipPath(
            clipper: UpperNipMessageClipperTwo(MessageType.send),
            child: GestureDetector(
              onTap: () {
                launchMaps("42700-000"); 
              },
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFE4FDCA),
                ),
                child: Text(
                  "$cepMessage", // Exibir o CEP como um link
                  style: TextStyle(
                    fontSize: 17,
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void launchMaps(String cep) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$cep';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

