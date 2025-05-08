import 'package:flutter/material.dart';

void irPara(BuildContext context, Widget $widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => $widget),
  );
}