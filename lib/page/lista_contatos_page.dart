import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lista_contatos/model/contatos_model.dart';
import 'package:lista_contatos/page/contato_detalhes_page.dart';
import 'package:lista_contatos/repository/sqlite_repository.dart';
import 'package:lista_contatos/util/mostrar_info.dart';

class ListaContatosPages extends StatefulWidget {
  const ListaContatosPages({super.key});

  @override
  State<ListaContatosPages> createState() => _ListaContatosPagesState();
}

class _ListaContatosPagesState extends State<ListaContatosPages> {
  final _repository = SQLITERepository();
  var _contatos = const <ContatosModel>[];

  @override
  void initState() {
    super.initState();
    obterLista();
  }

  obterLista() async {
    _contatos = await _repository.obterListaConattos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 34, 78, 134),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                textAlign: TextAlign.start,
                "Meus Contatos",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              const SizedBox(height: 20),
              _contatos.isEmpty
                  ? Container(
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
                      child: const Column(
                        children: [
                          Text(
                            "Aguardando contatos...",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height / 1.25,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 22,
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
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Lita de contatos",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 34, 78, 134),
                                    ),
                                  ),
                                  Text(
                                    _contatos.length > 1
                                        ? "${_contatos.length} contatos"
                                        : "${_contatos.length} contato",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 34, 78, 134),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            flex: 30,
                            child: SizedBox(
                              child: ListView.builder(
                                itemCount: _contatos.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  var contatos = _contatos[index];
                                  return Dismissible(
                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(45),
                                          bottomLeft: Radius.circular(45),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.delete),
                                            Text(
                                              "APAGAR",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    direction: DismissDirection.startToEnd,
                                    confirmDismiss: (direction) async {
                                      return await mostrarInfo(
                                        contatos.id,
                                        context: context,
                                        mensagem: "Ação irrecuperável...",
                                        title:
                                            "Deseja realmente excluir este contato?",
                                        confirmacao: true,
                                      );
                                    },
                                    key: Key(contatos.id.toString()),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ContatoDetalhesPage(
                                              item: _contatos[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(45),
                                            bottomLeft: Radius.circular(45),
                                          ),
                                        ),
                                        elevation: 5,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(45),
                                              bottomLeft: Radius.circular(45),
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 2,
                                          ),
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
                                                          File(contatos
                                                              .imageUrl),
                                                        ),
                                                      ),
                                                    )
                                                  : Image.network(
                                                      "https://www.imagensempng.com.br/wp-content/uploads/2021/08/02-52.png",
                                                      scale: 5,
                                                    ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    right: 16),
                                              ),
                                              Text(
                                                " ${contatos.nome}  ${contatos.sobreName}",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
