import 'dart:io';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lista_contatos/model/contatos_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lista_contatos/page/editar_contatos_page.dart';
import 'package:lista_contatos/shared/constants/color_defualt.dart';

class DetalhesContatoPage extends StatefulWidget {
  final ContatosModel item;
  const DetalhesContatoPage({super.key, required this.item});

  @override
  State<DetalhesContatoPage> createState() => _DetalhesContatoPageState();
}

class _DetalhesContatoPageState extends State<DetalhesContatoPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ConvexAppBar.badge(
          const {},
          backgroundColor: CustomColor().getPrimeiroContainer(),
          items: const [
            TabItem(icon: FontAwesomeIcons.arrowLeft, title: 'Voltar'),
            TabItem(icon: FontAwesomeIcons.userPen, title: 'Editar'),
          ],
          controller: tabController,
          onTap: (i) async {
            if (i == 0) {
              Navigator.pop(context);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => EditarContatosPage(
                    item: widget.item,
                  ),
                ),
              );
            }
          },
        ),
        backgroundColor: CustomColor().getPrimeiroContainer(),
        body: Column(
          children: [
            const SizedBox(
              height: 36,
            ),
            widget.item.imageUrl != ""
                ? ClipOval(
                    child: Image(
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      image: FileImage(
                        scale: 22,
                        File(widget.item.imageUrl),
                      ),
                    ),
                  )
                : Image.asset(
                    "assets/images/user.png",
                    scale: 5,
                  ),
            const SizedBox(height: 20),
            Text(
              "${widget.item.nome} ${widget.item.sobreName}",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(225, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height / 1.96,
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(225, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 19),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Card(
                      color: const Color.fromARGB(118, 255, 255, 255),
                      elevation: 5,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Telefone",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 19, 4, 228)),
                            ),
                            Text(
                              widget.item.telefone,
                              style: const TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      color: const Color.fromARGB(118, 255, 255, 255),
                      elevation: 5,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "E-mail",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 19, 4, 228)),
                            ),
                            Text(
                              widget.item.email,
                              style: const TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      color: const Color.fromARGB(118, 255, 255, 255),
                      elevation: 5,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Data Nascimento",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 19, 4, 228)),
                            ),
                            Text(
                              widget.item.dataNascimento,
                              style: const TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Card(
                      color: const Color.fromARGB(118, 255, 255, 255),
                      elevation: 5,
                      child: Container(
                        width: double.infinity,
                        height: 140,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Informações",
                              style: TextStyle(
                                color: Color.fromARGB(255, 19, 4, 228),
                              ),
                            ),
                            Text(
                              widget.item.informacoes,
                              style: const TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
