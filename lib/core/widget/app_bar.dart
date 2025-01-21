import 'package:flutter/material.dart';

AppBar appBar(
    {String? text,
    required double fontSize,
    IconData? icon,
    required title,
    List<Widget>? actions,
    void Function()? onPressed}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
          color: Colors.black, fontSize: fontSize, fontWeight: FontWeight.bold),
    ),
    leading: Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
        ),
        const Text("")
      ],
    ),
    actions: actions,
  );
}
