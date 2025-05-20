import 'package:flutter/material.dart';

void irPara(BuildContext context, Widget pagina) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => pagina),
  );
}