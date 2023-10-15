import 'package:flutter/material.dart';

class ListaContatosPages extends StatefulWidget {
  const ListaContatosPages({super.key});

  @override
  State<ListaContatosPages> createState() => _ListaContatosPagesState();
}

class _ListaContatosPagesState extends State<ListaContatosPages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cadastro');
            // Navigator.popAndPushNamed(context, '/cadastro');
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 34, 78, 134),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "Meus Contatos",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  children: [const Text("Contatos salvos")],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
