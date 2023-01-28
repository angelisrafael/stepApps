import 'package:flutter/material.dart';

Widget pageBody(String imgUrl, String title, String description) {
  return Padding(
    padding: const EdgeInsets.all(40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          imgUrl,
          scale: 0.8,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 40, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          description,
          style: TextStyle(fontSize: 20, color: Colors.black26),
        )
      ],
    ),
  );
}
