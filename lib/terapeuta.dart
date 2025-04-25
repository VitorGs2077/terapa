import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:terapa/cadastro.dart';
import 'package:terapa/home.dart';
import 'package:terapa/login.dart';
import 'package:terapa/main.dart';
// Tom azul: (158, 19, 130, 155)
// Tom verde: (237, 108, 171, 124)
class Terapeuta extends StatelessWidget {
  const Terapeuta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: TelaLogin(),
    );
    }
  }
class TelaTerapeuta extends StatefulWidget {
  const TelaTerapeuta({super.key});

  @override
  State<TelaTerapeuta> createState() => _TelaTerapeutaState();
}
class _TelaTerapeutaState extends State<TelaTerapeuta> {
  get icon => null;
  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    //final currentWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<Directory>(
      future: getApplicationDocumentsDirectory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Erro ao acessar diretório"));
        } else if (snapshot.hasData) {
          final directory = snapshot.data!;
          final nomePath = '${directory.path}/nome.txt';
          final file = File(nomePath);

          return FutureBuilder<String>(
          future: file.readAsString(),
          builder: (context, nomeSnapshot) {
            if (nomeSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (nomeSnapshot.hasError || !nomeSnapshot.hasData) {
              return const Center(child: Text("Erro ao ler nome do usuário"));
            }

            final nomeUsuario = nomeSnapshot.data!;
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            appBar: AppBar(
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
              title: Text("perfil do terapeuta",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('imagens/terapeuta.jpg'), // aq tem q colocar a imagem do terapeuta
                  ),
                  SizedBox(height: currentHeight * 0.05),
                  Text(
                    "nome do terapeuta kkkk",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: currentHeight * 0.05),
                  Text(
                    "especialista em terapia",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: currentHeight * 0.15),
                  ElevatedButton.icon(
                    onPressed: () {
                      print("clicou no botao de chat");
                    },
                    icon: Icon(Icons.chat),
                    label: Text("iniciar chat"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(158, 19, 130, 155),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      child: Icon(Icons.home, color: Colors.white),
                    ),
                    label: "Início",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat, color: Colors.white),
                    label: 'Papo Cabeça',
                  ),
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => cadastro()),
                        );
                      },
                      child: Icon(Icons.search, color: Colors.white),
                    ),
                    label: 'Pesquisa',
                  ),
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TelaLogin()),
                        );
                      },
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    label: nomeUsuario,
                    ),
                  ],
                ),
              ),
            );
                  });
                }
                return const Center(child: Text("Diretório não encontrado"));
              },
            );
      }
    }