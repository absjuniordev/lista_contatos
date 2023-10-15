import 'package:flutter/material.dart';

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
              Container(),
              const SizedBox(height: 50),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
