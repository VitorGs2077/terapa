import 'package:flutter/material.dart';
import 'package:terapa/main.dart';
import 'package:terapa/login.dart';
class cadastro extends StatefulWidget {
  const cadastro({super.key});
  @override
  State<cadastro> createState() => _cadastroState();
}
class _cadastroState extends State<cadastro> {
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
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => MyHomePage())
            );
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
                  TextButton(onPressed:(){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => TelaLogin())
                    );
                  },
                  child: Text(
                    "Logar", 
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 230, 0), 
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