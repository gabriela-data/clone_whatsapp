import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> statusImages = [
      "images/status1.jpg",
      "images/status2.jpg",
      "images/status3.jpg",
      "images/status4.jpg",
      "images/status5.jpg",
      // Adicione aqui os caminhos de outras imagens de status
    ];

    List<String> statusNames = [
      "Luciane",
      "João",
      "Paulo",
      "Sueli",
      "Jorge",
      // Adicione aqui os nomes para cada status
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.grey, width: 3),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        "images/status1.jpg",
                        height: 55,
                        width: 55,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Meu Status",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Hoje, 12:30 am",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_vert,
                    color: Color(0xFF075E55),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Atualizações Recentes",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: 8),
                  for (int i = 0; i < statusImages.length; i++)
                    Column(
                      children: [
                        if (statusNames[i] == "Luciane")
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(1.5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 3,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.asset(
                                    statusImages[i],
                                    height: 55,
                                    width: 55,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    statusNames[i],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Hoje, 10:35",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        if (statusNames[i] != "Luciane")
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(1.5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 3,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.asset(
                                    statusImages[i],
                                    height: 55,
                                    width: 55,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    statusNames[i],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Hoje, 10:35",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        SizedBox(height: 10),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
