import 'package:flutter/material.dart';
import 'package:lista_contatos/page/cadastro_contatos_page.dart';
import 'package:lista_contatos/page/home_page.dart';
import 'package:lista_contatos/page/lista_contatos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lista de Contatos",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 34, 78, 134)),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/contatos': (context) => const ListaContatosPages(),
        '/cadastro': (context) => const CadastroContatosPage(),
      },
      initialRoute: '/',
    );
  }
}
