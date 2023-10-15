import 'package:flutter/material.dart';
import 'package:lista_contatos/page/cadastro_contatos_page.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black12),
      ),
      routes: {
        '/contatos': (context) => const ListaContatosPages(),
        '/cadastro': (context) => const CadastroContatosPage(),
      },
      initialRoute: '/contatos',
    );
  }
}
