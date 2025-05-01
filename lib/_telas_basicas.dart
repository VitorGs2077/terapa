import 'package:flutter/material.dart';
import 'package:terapa/_func.dart';
import 'package:terapa/perfil.dart';
import 'package:terapa/pesquisa.dart';

PreferredSizeWidget userAppBar(context, textoAppBar){
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Text(textoAppBar),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(158, 19, 130, 155),
            Color.fromARGB(237, 108, 171, 124),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
  );
}

Widget bottomUserBar(context, nomeUsuario){
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(158, 19, 130, 155),
          Color.fromARGB(237, 108, 171, 124)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, color: Colors.white),
          label: 'Papo Cabeça',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              irPara(context, TelaPesquisa());
            },
            child: Icon(Icons.search, color: Colors.white),
          ),
          label: 'Pesquisa',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              irPara(context, TelaPerfil());
            },
            child: Icon(Icons.person, color: Colors.white),
          ),
          label: "$nomeUsuario",
          ),
        ],
      ),
    );
}