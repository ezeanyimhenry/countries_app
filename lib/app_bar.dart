import 'package:flutter/material.dart';
import 'package:countries_app/main.dart';

PreferredSizeWidget myAppBar(String? title) {
  return AppBar(
    // backgroundColor: Color.fromRGBO(156, 204, 101, 1),
    //background color of Appbar to green
    title: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            currentTheme.currentLogo(),
            fit: BoxFit.cover,
            width: 150,
          ),
        ),
      ],
    ),

    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.wb_sunny_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          currentTheme.switchTheme();
        },
      )
    ],
  );
}
