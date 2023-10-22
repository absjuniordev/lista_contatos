import 'package:flutter/material.dart';
import 'package:lista_contatos/repository/sqlite_repository.dart';

var _repository = SQLITERepository();

mostrarInfo(
  int id, {
  required BuildContext context,
  required String mensagem,
  required String title,
  required bool confirmacao,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(mensagem),
        actions: [
          confirmacao == true
              ? Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                    onPressed: () {
                      _repository.apagarContato(id);
                      Navigator.popAndPushNamed(context, '/');
                    },
                    child: const Text("Sim"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Não"),
                  ),
                ])
              : TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                )
        ],
      );
    },
  );
}
