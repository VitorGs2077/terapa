import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:terapa/componentes/_func.dart';
import 'package:terapa/componentes/_telas_basicas.dart';
import 'package:terapa/telas/pesquisa.dart';
import 'package:terapa/telas/terapeuta.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  get icon => null;
  
 @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
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
            appBar: userAppBar(context, "Bem vindo, $nomeUsuario!"),
            body: Column(
              children: [
                Container(
                  width: currentWidth*0.9,
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: FractionallySizedBox( 
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(61, 19, 130, 155),
                              Color.fromARGB(104, 108, 171, 124)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                            )
                          ),
                          child: Card(
                            color: const Color.fromARGB(0, 0, 0, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Para começar, escolha um profissional encontrado em sua área",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "Verdana"
                                  ),
                              ),
                            )
                          ),
                        )),
                    ),
                  )
                ),
                SizedBox(
                  height: currentHeight*0.48,
                  child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(61, 19, 130, 155),
                            Color.fromARGB(104, 108, 171, 124)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ListTile(
                        tileColor: Color.fromARGB(255, 255, 255, 0),
                        leading: Icon(Icons.person_2_outlined),
                        title: Text('Terapeuta ${index + 1}'),
                        subtitle: Text('Rua Canela ${index + 1}'),
                        trailing: Icon(Icons.arrow_forward, color: Colors.red,),
                        onTap: () {
                          irPara(context, TelaTerapeuta());
                        },
                      ),
                    ),
                  );
                },
              ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: (){
                    irPara(context, TelaPesquisa());
                  }, 
                  child:Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(61, 19, 130, 155),
                        Color.fromARGB(104, 108, 171, 124)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                    )
                   ),
                    child: Text("Procurando por mais opções? Aperte aqui!")
                  ),
                )
              ]
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