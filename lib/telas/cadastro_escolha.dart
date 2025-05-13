import 'package:flutter/material.dart';
import 'package:terapa/componentes/_func.dart';
import 'package:terapa/telas/cadastroUsuario.dart';
import 'package:terapa/telas/cadastroTerapeuta.dart';

class escolhaLogin extends StatefulWidget {
  const escolhaLogin({super.key});

  @override
  State<escolhaLogin> createState() => _escolhaLoginState();
}

class _escolhaLoginState extends State<escolhaLogin> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("imagens/logo_terapa.png"),
              SizedBox(
                width: currentWidth*0.8,
                height: currentHeight*0.1,
                child: Card(
                  child: Center(child: Text("Como você deseja se cadastrar?", style: TextStyle(fontSize: currentWidth*0.05))),
                ),
              ),
              SizedBox(
                height: currentHeight*0.05,
              ),
            SizedBox(
              height: currentHeight*0.1,
              width: currentWidth*0.7,
              child: ElevatedButton(
                // style: ButtonStyle(
                //   backgroundColor: WidgetStateProperty.all(Colors.blue),
                // ),
                onPressed: (){irPara(context, TelaCadastroUsuario());}, child: Center(child: Text("Usuário", style: TextStyle(fontSize: currentWidth*0.05),))),
            ),
            SizedBox(
              height: currentHeight*0.05,
            ),
            SizedBox(
              height: currentHeight*0.1,
              width: currentWidth*0.7,
              child: ElevatedButton(onPressed: (){irPara(context, TelaCadastroTerapeuta());}, child: Text("Profissional", style: TextStyle(fontSize: currentWidth*0.05))),
            ),
          ],
          )
        ),
    );
  }
}