import 'package:flutter/material.dart';
import 'package:terapa/componentes/_func.dart';
import 'package:terapa/telas/login.dart';

class TelaCadastroTerapeuta2 extends StatefulWidget {
  const TelaCadastroTerapeuta2({super.key});

  @override
  State<TelaCadastroTerapeuta2> createState() => _TelaCadastroTerapeuta2State();
}

class _TelaCadastroTerapeuta2State extends State<TelaCadastroTerapeuta2> {
  String _dropdownValue = "Olá1"; // Initialize with a default value

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Container(
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
              Text("Escolha a sua área:", style: TextStyle(color: Colors.white),),
              SizedBox(
                height: currentHeight * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                ),
                height: 40,
                width: currentWidth * 0.8,
                child: DropdownButton(
                  items: const [
                    DropdownMenuItem(child: Text("Terapeuta"), value: "Olá1"),
                    DropdownMenuItem(child: Text("Psiquiatra"), value: "Olá2"),
                    DropdownMenuItem(child: Text("Psicólogo"), value: "Olá3"),
                    DropdownMenuItem(child: Text("Outro"), value: "Olá4"),
                  ], 
                  value: _dropdownValue,
                  onChanged: (value) => setState(() => _dropdownValue = value as String),
                  isExpanded: true,
                ),
              ),
              SizedBox(
                height: currentHeight * 0.03,
              ),
              Container(
                width: currentWidth*0.8,
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Continuar"),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    minimumSize: WidgetStateProperty.all(Size(400,50)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32))
                            ))),
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