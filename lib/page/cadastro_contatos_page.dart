import 'dart:io';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_contatos/model/contatos_model.dart';
import 'package:lista_contatos/shared/constants/color_defualt.dart';
import 'package:lista_contatos/util/mostrar_info.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:lista_contatos/repository/sqlite_repository.dart';

class CadastroContatosPage extends StatefulWidget {
  const CadastroContatosPage({super.key});

  @override
  State<CadastroContatosPage> createState() => _CadastroContatosPageState();
}

class _CadastroContatosPageState extends State<CadastroContatosPage>
    with TickerProviderStateMixin {
  var controllerNome = TextEditingController(text: "");
  var controllerSobreNome = TextEditingController(text: "");
  var controllerApelido = TextEditingController(text: "");
  var controllerTelefone = TextEditingController(text: "");
  var controllerEmail = TextEditingController(text: "");
  var controllerDataNascimento = TextEditingController(text: "");
  var controllerInformacoes = TextEditingController(text: "");

  // ignore: prefer_final_fields
  var _repository = SQLITERepository();

  late TabController tabController;

  XFile? photo;
  XFile? image;

  @override
  void initState() {
    super.initState();

    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: ConvexAppBar.badge(
          backgroundColor: CustomColor().getPrimeiroContainer(),
          color: Colors.white,
          const {},
          items: const [
            TabItem(
              icon: FontAwesomeIcons.xmark,
              title: "Sair",
            ),
            TabItem(
              icon: FontAwesomeIcons.check,
              title: "Salvar",
            ),
          ],
          controller: tabController,
          onTap: (i) {
            if (i == 0) {
              Navigator.pop(context);
            } else if (controllerNome.text.isEmpty ||
                controllerNome.text.length < 3) {
              mostrarInfo(
                0,
                context: context,
                mensagem: "Nome inválido",
                title: "Erro",
                confirmacao: false,
              );
            } else if (controllerTelefone.text.isEmpty ||
                controllerTelefone.text.length < 11) {
              mostrarInfo(
                0,
                context: context,
                mensagem: "Número inválido",
                title: "Erro",
                confirmacao: false,
              );
            } else {
              _repository.salvarListaContatos(
                ContatosModel(
                  0,
                  controllerNome.text,
                  controllerSobreNome.text,
                  controllerApelido.text,
                  controllerTelefone.text,
                  controllerEmail.text,
                  controllerDataNascimento.text,
                  controllerInformacoes.text,
                  photo == null ? "" : photo!.path,
                ),
              );

              Navigator.popAndPushNamed(context, '/');
              setState(() {});
            }
          },
        ),
        backgroundColor: const Color.fromARGB(255, 34, 78, 134),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Novo Contato",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
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
                    InkWell(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();

                        photo =
                            await picker.pickImage(source: ImageSource.camera);

                        if (photo != null) {
                          String path = (await path_provider
                                  .getApplicationDocumentsDirectory())
                              .path;
                          String name = basename(photo!.path);
                          await GallerySaver.saveImage(photo!.path);

                          await photo!.saveTo("$path/$name");
                        }
                        setState(() {});
                      },
                      child: Container(
                        height: 150,
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: photo == null
                            ? Image.asset(
                                "assets/images/user.png",
                                scale: 5,
                              )
                            : ClipOval(
                                child: Image.file(
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  File(photo!.path),
                                  scale: 6,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controllerNome,
                              decoration: const InputDecoration(
                                label: Text("Nome"),
                              ),
                            ),
                            TextFormField(
                              controller: controllerSobreNome,
                              decoration: const InputDecoration(
                                label: Text("Sobrenome"),
                              ),
                            ),
                            TextFormField(
                              controller: controllerApelido,
                              decoration: const InputDecoration(
                                label: Text("Apelido"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controllerTelefone,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter(),
                              ],
                              decoration: const InputDecoration(
                                label: Text("Telefone"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controllerEmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                label: Text("E-mail"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controllerDataNascimento,
                              inputFormatters: [
                                // obrigatório
                                FilteringTextInputFormatter.digitsOnly,
                                DataInputFormatter(),
                              ],
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                label: Text("Data Nascimento"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              maxLength: 60,
                              maxLines: 2,
                              controller: controllerInformacoes,
                              decoration: const InputDecoration(
                                label: Text("Informações Adcionais"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
