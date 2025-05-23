import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:terapa/componentes/_func.dart';
import 'package:terapa/componentes/_telas_basicas.dart';
import 'package:terapa/telas/tela_chatDE_VDD.dart';

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
      home: TelaTerapeuta(),
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
              centerTitle: true,
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
              title: Text("Perfil do Terapeuta",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('imagens/deni.jpeg'),
                  ),
                  SizedBox(height: currentHeight * 0.05),
                  Text(
                    "Denilson",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: currentHeight * 0.05),
                  Text(
                    "Especialista em Terapia",
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
                      irPara(context, ChatTerapeuta());
                    },
                    icon: Icon(Icons.chat),
                    label: Text("Iniciar Chat"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(158, 19, 130, 155),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar:bottomUserBar(context, nomeUsuario)
            );
                  });
                }
                return const Center(child: Text("Diretório não encontrado"));
              },
            );
      }
    }