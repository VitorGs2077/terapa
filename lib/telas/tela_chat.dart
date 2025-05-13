import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:terapa/componentes/_telas_basicas.dart';

class TelaChat extends StatefulWidget {
  const TelaChat({super.key});

  @override
  State<TelaChat> createState() => _TelaChatState();
}

class _TelaChatState extends State<TelaChat> {
  @override
  Widget build(BuildContext context) {
    // final currentHeight = MediaQuery.of(context).size.height;
    // final currentWidth = MediaQuery.of(context).size.width;
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
            appBar: userAppBar(context, "Conversas"),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Center(child: Text("Terapeuta ${index + 1}")),
                  trailing: Icon(Icons.chat_bubble),
                );
              }
              
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