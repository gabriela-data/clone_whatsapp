import 'package:flutter/material.dart';

class ChatBottomBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.black38,
                    size:30,
                ),
                SizedBox(width: 5),
                Container(
                  width: 200,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration:   InputDecoration(
                      hintText: "Mensagem",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(
                    Icons.attach_email_outlined,
                    color: Colors.black38,
                ),
                SizedBox(width: 12),
                Icon(
                    Icons.camera_alt,
                    color: Colors.black38,
                    size:25,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF00887A),
              borderRadius: BorderRadius.circular(30)),
            child: Icon(
              Icons.mic,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}