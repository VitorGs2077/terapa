import 'package:flutter/material.dart';

class TelaPerfil extends StatefulWidget {
  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  String nomeUsuario = "Usuário"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Bem Vindo $nomeUsuario!'),
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
            backgroundImage: AssetImage('assets/user_placeholder.png'),
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
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}