import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:terapa/componentes/_telas_basicas.dart';
import 'package:terapa/telas/login.dart';
// Tom azul: (158, 19, 130, 155)
// Tom verde: (237, 108, 171, 124)

class Chat extends StatelessWidget {
  const Chat({super.key});

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
class TelaChat extends StatefulWidget {
  const TelaChat({super.key});

  @override
  State<TelaChat> createState() => _TelaChatState();
}
class _TelaChatState extends State<TelaChat> {
  get icon => null;
  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final _mensagemController = TextEditingController();
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
              print(nomeSnapshot.error);
              return const Center(child: Text("Erro ao ler nome do usuário"));
            } else if (nomeSnapshot.hasData) {
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
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisa',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Scaffold(
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: currentHeight * 0.1,
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
                    child: TextField(
                      controller: _mensagemController,
                      decoration: InputDecoration(
                        hintText: 'Digite sua mensagem',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () async {
                            String mensagem = _mensagemController.text;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(mensagem)),);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
            bottomNavigationBar: bottomUserBar(context, nomeUsuario)
            );
                  }
                  return const Center(child: Text("Erro desconhecido"));
        });
                  }
                  return const Center(child: Text("Erro desconhecido"));
              },
            );
          }
        }