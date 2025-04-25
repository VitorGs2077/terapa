import 'package:flutter/material.dart';
import 'package:terapa/login.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TelaPerfil extends StatefulWidget {
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Perfil $nomeUsuario!'),
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('imagens/terapeuta.jpg'),
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
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => TelaLogin()));
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
              icon: Icon(Icons.search, color: Colors.white),
              label: 'Pesquisa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, color: Colors.white),
              label: 'Agenda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: nomeUsuario,
            ),
          ],
        ),
      ),
    );
    }
    );
     }
     return const Center(child: Text("Diretório não encontrado"));
    }
   );
   }
   }

  

