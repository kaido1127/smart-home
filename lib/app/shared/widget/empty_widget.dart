import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget EmptyWidget() {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 50,
            backgroundColor: Colors.lightBlueAccent,
            child: Text(
              "?",
              style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 20,
        ),
        Text(
          "Danh sách trống",
          style: TextStyle(color: Colors.black54),
        ),
      ],
    ),
  );
}


