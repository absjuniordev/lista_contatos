import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class CadastroContatosPage extends StatefulWidget {
  const CadastroContatosPage({super.key});

  @override
  State<CadastroContatosPage> createState() => _CadastroContatosPageState();
}

class _CadastroContatosPageState extends State<CadastroContatosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 34, 78, 134),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/contatos');
                    },
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ),
                  const Text(
                    "Novo Contato",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Salvar",
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    ),
                  ),
                ],
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
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: Image.network(
                        "https://www.imagensempng.com.br/wp-content/uploads/2021/08/02-52.png",
                        scale: 5,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.white),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration:
                                const InputDecoration(label: Text("Nome")),
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(label: Text("Sobrenome")),
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(label: Text("Apelido")),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.white),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              // obrigatório
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
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.white),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              label: Text("E-mail"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.white),
                      child: Column(
                        children: [
                          TextFormField(
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
                    const SizedBox(height: 20),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Informações Adcionais"),
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
