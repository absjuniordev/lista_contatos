import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:lista_contatos/model/contatos_model.dart';
import 'package:lista_contatos/repository/sqlite_repository.dart';

class ListaContatosPages extends StatefulWidget {
  const ListaContatosPages({super.key});

  @override
  State<ListaContatosPages> createState() => _ListaContatosPagesState();
}

class _ListaContatosPagesState extends State<ListaContatosPages> {
  SQLITERepository _repository = SQLITERepository();
  var _contatos = const <ContatosModel>[];
  @override
  void initState() {
    super.initState();
    obterLista();
  }

  obterLista() async {
    _contatos = await _repository.obterListaConattos();
    print(_contatos);
    setState(() {});
  }

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
                  top: 50,
                ),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(225, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        "Lita de contatos",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      flex: 30,
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: _contatos.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var contatos = _contatos[index];
                            return Card(
                              elevation: 5,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                height: 50,
                                child: Row(
                                  children: [
                                    contatos.imageUrl != ""
                                        ? ClipOval(
                                            child: Image(
                                              width: 45,
                                              height: 45,
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                scale: 22,
                                                File(contatos.imageUrl),
                                              ),
                                            ),
                                          )
                                        : Image.network(
                                            "https://www.imagensempng.com.br/wp-content/uploads/2021/08/02-52.png",
                                            scale: 5,
                                          ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 16),
                                    ),
                                    Text(
                                      " ${contatos.nome}  ${contatos.sobreName}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
