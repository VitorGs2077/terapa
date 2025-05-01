import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:terapa/_func.dart';
import 'package:terapa/cadastro.dart';
import 'package:terapa/home.dart';
class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  TextStyle style = TextStyle(
    fontFamily: "Montserrat", 
    fontSize: 20, 
    color: Colors.black);
  
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;

    final emailField = FractionallySizedBox(

      widthFactor: 0.7,
      child: TextField(
        controller: _emailController,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        ),
      ),
    );


    final passwordField = FractionallySizedBox(
      widthFactor: 0.7,
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        style: style,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Senha",
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        ),
      ),
    );

    final buttonLogin = FractionallySizedBox(
      widthFactor: 0.6,
      child:ButtonTheme(
        child: ElevatedButton(
          onPressed: () async {
            String email = _emailController.text;
            String password = _passwordController.text;
            if(email.isEmpty || password.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Preencha todos os campos!"))
              );
            }else{
              if (email.contains('.com') && email.contains('@')) {
                final directory = await getApplicationDocumentsDirectory();
                final senhaPath = '${directory.path}/senha.txt';
                final arquivoSenha = File(senhaPath);
                final emailPath = '${directory.path}/email.txt';
                final arquivoEmail = File(emailPath);
                if (await arquivoSenha.exists() && await arquivoEmail.exists()) {
                  String senhaContent = await arquivoSenha.readAsString();
                  String emailContent = await arquivoEmail.readAsString();
                  if (senhaContent == password && emailContent == email) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Login realizado com sucesso!"))
                    );
                    irPara(context, MyHomePage());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Email ou senha incorretos!"))
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login não encontrado!"))
                  );
                }
              } else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Email inválidos!"))
                );
              }
            }
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            minimumSize: WidgetStateProperty.all(Size(400,50)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32)
        )
      )
    ),
        child: Text("Login",
        textAlign: TextAlign.center,
        style: style.copyWith(color:Colors.black, fontWeight: FontWeight.bold)
          ),
        )
      )
    );

    return Scaffold(
      body:Container(
        width: currentWidth,
        height: currentHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color.fromARGB(150, 19, 130, 155),
              Color.fromARGB(200, 108, 171, 124),
            ],
          ),
        ),
        child:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: currentHeight*0.1),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Image.asset("imagens/logo_terapa.png")
                ),
              SizedBox(height: currentHeight*0.065),
              emailField,
              SizedBox(height: currentHeight*0.065),
              passwordField,
              SizedBox(height: currentHeight*0.065),
              buttonLogin,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Não tem uma conta?"), 
                  TextButton(onPressed:(){
                    irPara(context, cadastro());
                  },
                  child: Text(
                    "Cadastre-se", 
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 51, 0), 
                      fontWeight: FontWeight.bold
                    )
                  )
                  )
                ]
              ),
              SizedBox(height: currentHeight*0.2),
            ],
          )
        )
      )
    );
  }
}