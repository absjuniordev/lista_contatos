import 'dart:io';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
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
                      child: const Column(children: [
                        Text(
                          "Aguardando contatos...",
                          style: TextStyle(fontSize: 20),
                        )
                      ]),
                    )
                  : Container(
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

                                  obterLista();
                                  return Dismissible(
                                    background: Container(
                                      color: Colors.red,
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
                                        elevation: 5,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
