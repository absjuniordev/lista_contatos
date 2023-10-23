import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_contatos/model/contatos_model.dart';

Widget buildImageWidget(XFile? photo, ContatosModel widgetItem) {
  switch (photo) {
    case null:
      if (widgetItem.imageUrl.isEmpty) {
        return Image.asset(
          "assets/images/user.png",
          scale: 5,
        );
      } else {
        return ClipOval(
          child: Image.file(
            File(widgetItem.imageUrl),
            width: 150,
            height: 150,
            fit: BoxFit.cover,
            scale: 6,
          ),
        );
      }

    default:
      return ClipOval(
        child: Image.file(
          File(photo.path),
          width: 150,
          height: 150,
          fit: BoxFit.cover,
          scale: 6,
        ),
      );
  }
}
