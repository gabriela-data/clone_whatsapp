import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
           for(int i = 1; i <4; i++)
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      "images/profile$i.jpg",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        "Pai",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                                Icons.call_made,
                              color: Color(0xFF075E55),
                              size: 19,
                            ),
                            SizedBox(width: 5),
                            Text(
                                "(1) Hoje, 12:30",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Icon(
                      CupertinoIcons.videocam_fill,
                      color: Color(0xFF075E55),
                      size: 28,
                    ),
                  )
                ],
              ),
            ),
            for(int i = 4; i <7; i++)
              Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "images/profile$i.jpg",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mãe",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.call_received,
                                color: Colors.red,
                                size: 19,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "(1) Hoje, 12:30",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Icon(
                        Icons.call_sharp,
                        color: Color(0xFF075E55),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),

    ),
    );
  }
}