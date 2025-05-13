import 'package:flutter/material.dart';
import 'package:terapa/componentes/_func.dart';
import 'package:terapa/componentes/_telas_basicas.dart';
import 'package:terapa/telas/inf.dart';
import 'package:terapa/telas/login.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {

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
      backgroundColor: Colors.white,
      appBar: userAppBar(context, "Perfil de $nomeUsuario"),
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('imagens/adicionarFoto.webp'),
          ),
          SizedBox(height: 16),
          Text(
            nomeUsuario,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 32),
          ListTile(
            leading: Icon(Icons.person, size: 32),
            title: Text(
              'Informações pessoais',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
            irPara(context, TelaInf());
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 32),
            title: Text(
              'Configurações',
              style: TextStyle(fontSize: 18),
                          ),
            onTap: () {
              
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app, size: 32),
            title: Text(
              'Sair',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              irPara(context, TelaLogin());
            },
          ),
        ],
      ),
      bottomNavigationBar: bottomUserBar(context, nomeUsuario),
    );
    }
    );
     }
     return const Center(child: Text("Diretório não encontrado"));
    }
   );
   }
   }

  

