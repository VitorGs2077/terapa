import 'package:flutter/material.dart';
import 'package:terapa/componentes/_func.dart';
import 'package:terapa/telas/home.dart';
import 'package:terapa/telas/perfil.dart';
import 'package:terapa/telas/pesquisa.dart';
import 'package:terapa/telas/tela_chat.dart';

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
          icon: GestureDetector(
            onTap: () {
              irPara(context, MyHomePage());
            },
            child: Icon(Icons.home, color: Colors.white),
          ),
        label: "Início",
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              irPara(context, TelaChat());
            },
            child: Icon(Icons.chat, color: Colors.white),
          ),
          label: "Papo Cabeça",
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              irPara(context, TelaPesquisa());
            },
            child: Icon(Icons.search, color: Colors.white),
          ),
          label: "Pesquisar",
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              irPara(context, TelaPerfil());
            },
            child: Icon(Icons.person, color: Colors.white),
          ),
          label: nomeUsuario,
          ),
        ],
      ),
    );
}