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
            showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text("Adcione um contato",
                      textAlign: TextAlign.center),
                  content: const SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(),
                        TextField(),
                        TextField(),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: () async {
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      child: const Text("Salvar"),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: const Color.fromARGB(255, 34, 78, 134),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Container(
                  child: Column(
                    children: [
                      Text("Lista de Contaso"),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.45,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
