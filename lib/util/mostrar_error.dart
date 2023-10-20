import 'package:flutter/material.dart';

mostrarErro(BuildContext context, String mensagem) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Erro"),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha a caixa de diálogo
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
