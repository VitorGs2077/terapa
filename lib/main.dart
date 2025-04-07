import 'package:flutter/material.dart';
import 'package:terapa/cadastro.dart.txt';
import 'package:terapa/login.dart';
// Tom azul: (158, 19, 130, 155)
// Tom verde: (237, 108, 171, 124)
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: TelaLogin(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color.fromARGB(158, 19, 130, 155), Color.fromARGB(237, 108, 171, 124)],
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
              icon: Icon(Icons.chat, color: Colors.white),
              label: 'Papo Cabeça',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cadastro()),
                  );
                },
                child: Icon(Icons.search, color: Colors.white),
              ),
              label: 'Pesquisa',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaLogin()),
                  );
                },
                child: Icon(Icons.person, color: Colors.white),
              ),
              label: 'Perfil',
            ),
          ],
        )
      ),
    );
  }
}