import 'dart:io';
import 'package:flutter/material.dart';
import 'package:terapa/componentes/_func.dart';
import 'package:terapa/telas/home.dart';
import 'package:terapa/telas/login.dart';
import 'package:path_provider/path_provider.dart';
class TelaCadastroUsuario extends StatefulWidget {
  const TelaCadastroUsuario({super.key});
  @override
  State<TelaCadastroUsuario> createState() => _TelaCadastroUsuarioState();
}
class _TelaCadastroUsuarioState extends State<TelaCadastroUsuario> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nomeController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  TextStyle style = TextStyle(
    fontFamily: "Montserrat", 
    fontSize: 20, color: Colors.black);
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

    final nomeField = FractionallySizedBox(
      widthFactor: 0.7,
      child: TextField(
        controller: _nomeController,
        obscureText: false,
        style: style,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nome",
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

    final confirmPasswordField = FractionallySizedBox(
      widthFactor: 0.7,
      child: TextField(
        controller: _confirmPasswordController,
        obscureText: true,
        style: style,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirmar Senha",
          hintStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        ),
      ),
    );

    final buttonRegister = FractionallySizedBox(
      widthFactor: 0.6,
      child:ButtonTheme(
        child: ElevatedButton(
          onPressed: () async {
            String email = _emailController.text;
            String password = _passwordController.text;
            String nome = _nomeController.text;
            String confirmPassword = _confirmPasswordController.text;
            if(email.isEmpty || password.isEmpty || nome.isEmpty || confirmPassword.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Preencha todos os campos!"))
              );
            }else{
              if (email.contains('.com') && email.contains('@') && password == confirmPassword) {
                final directory = await getApplicationDocumentsDirectory();

                final senhaPath = '${directory.path}/senha.txt';
                final file1 = File(senhaPath);
                await file1.writeAsString(password);

                final emailPath = '${directory.path}/email.txt';
                final file2 = File(emailPath);
                await file2.writeAsString(email);

                final nomePath = '${directory.path}/nome.txt';
                final file3 = File(nomePath);
                await file3.writeAsString(nome);
                irPara(context, MyHomePage());
              } else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Email ou senha inválidos!"))
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
        child: Text("Cadastrar",
        textAlign: TextAlign.center,
        style: style.copyWith(color:Colors.black, fontWeight: FontWeight.bold)
          ),
        )
      )
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              SizedBox(height: currentHeight*0.035),
              nomeField,
              SizedBox(height: currentHeight*0.035),
              emailField,
              SizedBox(height: currentHeight*0.035),
              passwordField,
              SizedBox(height: currentHeight*0.035),
              confirmPasswordField,
              SizedBox(height: currentHeight*0.035),
              buttonRegister,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Já tem uma conta?"), 
                  TextButton(
                    onPressed:(){
                      irPara(context, TelaLogin());
                    },
                    child: Text(
                      "Logar", 
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