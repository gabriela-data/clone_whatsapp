import 'package:flutter/material.dart';

class ChatsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            for (int i = 1; i < 12; i++)
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context,"chatPage");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          "images/profile$i.jpg",
                          height: 65,
                          width: 65,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 65,
                              width: 65,
                              color: Colors.grey,
                              child: Icon(Icons.error),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Programmer",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Olá, como vai?",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "12:13",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF0FCE5E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            alignment: Alignment.center,
                            width: 27,
                            height: 27,
                            decoration: BoxDecoration(
                              color: Color(0xFF0FCE5E),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "2",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
