import 'package:flutter/material.dart';
import 'package:terapa/componentes/_telas_basicas.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TelaInf extends StatefulWidget {
  const TelaInf({super.key});

  @override
  _TelaInfState createState() => _TelaInfState();
}

class _TelaInfState extends State<TelaInf> {
  Future<Map<String, String>> _carregarDadosUsuario() async {
    final directory = await getApplicationDocumentsDirectory();

    final nomePath = '${directory.path}/nome.txt';
    final emailPath = '${directory.path}/email.txt';
    final senhaPath = '${directory.path}/senha.txt';

    final nome = await File(nomePath).readAsString();
    final email = await File(emailPath).readAsString();
    final senha = await File(senhaPath).readAsString();

    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: _carregarDadosUsuario(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text("Erro ao carregar os dados do usuário"));
        }

        final dadosUsuario = snapshot.data!;
        final nomeUsuario = dadosUsuario['nome']!;
        final emailUsuario = dadosUsuario['email']!;
        final senhaUsuario = dadosUsuario['senha']!;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: userAppBar(context, "Dados pessoais"),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 50,
                  backgroundImage: AssetImage('imagens/terapeuta.jpg'),
                ),
              const SizedBox(height: 16),
              Text(
                nomeUsuario,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
                ListTile(
                leading: const Icon(Icons.person, size: 32),
                title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nome: $nomeUsuario',
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 20,))
                  
                ],
                  
                  
               
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email, size: 32),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email: $emailUsuario",
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 20,))
                  ]
                 
                ),
               
              ),
              
              ListTile(
                leading: const Icon(Icons.lock, size: 32),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Senha: ${'*' * senhaUsuario.length}',
                  style: const TextStyle(fontSize: 18),),
                 IconButton(onPressed: (){}, icon: Icon(Icons.edit, size: 20,))

                  ]
                  
                ),
              ),
            ],
          ),
          bottomNavigationBar: bottomUserBar(context, nomeUsuario),
        );
      },
    );
  }
}