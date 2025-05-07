import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:terapa/componentes/_telas_basicas.dart';

class TelaHomeLogada extends StatefulWidget {
  const TelaHomeLogada({super.key});

  @override
  State<TelaHomeLogada> createState() => TelaHomeLogadaState();
}

class TelaHomeLogadaState extends State<TelaHomeLogada> {
  @override
  Widget build(BuildContext context) {
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
                appBar: userAppBar(context, "Bem vindo $nomeUsuario!"),
                body: Center(
                  child: Column(
                    children: [
                      Image.asset("imagens/calendario.jpeg"),
                      Card(
                        child: Text("Kaboom"),
                      )
                    ],
                  ),
                ),
                bottomNavigationBar: bottomUserBar(context, nomeUsuario)
              );
            },
          );
        } else {
          return const Center(child: Text("Diretório não encontrado"));
        }
      },
    );
  }
}