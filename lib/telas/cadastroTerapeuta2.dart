import 'package:flutter/material.dart';
import 'package:terapa/componentes/_func.dart';
import 'package:terapa/telas/login.dart';

class TelaCadastroTerapeuta2 extends StatefulWidget {
  const TelaCadastroTerapeuta2({super.key});

  @override
  State<TelaCadastroTerapeuta2> createState() => _TelaCadastroTerapeuta2State();
}

class _TelaCadastroTerapeuta2State extends State<TelaCadastroTerapeuta2> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
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
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Já tem uma conta?"), 
                  TextButton(onPressed:(){
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