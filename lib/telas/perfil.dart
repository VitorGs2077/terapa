import 'package:flutter/material.dart';
import 'package:terapa/componentes/_func.dart';
import 'package:terapa/componentes/_telas_basicas.dart';
import 'package:terapa/telas/inf.dart';
import 'package:terapa/telas/login.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
File? _selectedImage;

Future<void> _pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    setState(() {
      _selectedImage = File(pickedFile.path);
      });
    }
  }

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

        final fotoDePerfil = GestureDetector(
      onTap: _pickImage,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            Color.fromARGB(61, 19, 130, 155),
            Color.fromARGB(104, 108, 171, 124)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.transparent,
          backgroundImage: _selectedImage != null
              ? FileImage(_selectedImage!)
              : AssetImage('imagens/adicionarFoto.webp') as ImageProvider,
        ),
      ),
    );

        final nomeUsuario = nomeSnapshot.data!;
        return Scaffold(
      backgroundColor: Colors.white,
      appBar: userAppBar(context, "Perfil de $nomeUsuario"),
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   padding: const EdgeInsets.all(16),
          //   decoration: BoxDecoration(
          //         gradient: const LinearGradient(
          //           colors: [
          //             Color.fromARGB(61, 19, 130, 155),
          //             Color.fromARGB(104, 108, 171, 124)
          //           ],
          //           begin: Alignment.topLeft,
          //           end: Alignment.bottomRight),
          //         borderRadius: BorderRadius.circular(100)),
          
          // ),
          fotoDePerfil,
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

  

