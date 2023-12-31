import 'package:lista_contatos/model/contatos_model.dart';
import 'package:lista_contatos/repository/sqlite_database.dart';

class SQLITERepository {
  Future<List<ContatosModel>> obterListaConattos() async {
    List<ContatosModel> contatos = [];

    var db = await SQLTEDatabase().obterDB();
    var result = await db.rawQuery(
        'SELECT id, name, sobreName, apelido, telefone, email , dataNascimento, informacoes, imageUrl FROM contatos');
    for (var element in result) {
      contatos.add(
        ContatosModel(
          int.parse(element['id'].toString()),
          element['name'].toString(),
          element['sobreName'].toString(),
          element['apelido'].toString(),
          element['telefone'].toString(),
          element['email'].toString(),
          element['dataNascimento'].toString(),
          element['informacoes'].toString(),
          element['imageUrl'].toString(),
        ),
      );
    }

    return contatos;
  }

  Future<void> salvarListaContatos(ContatosModel contatosModel) async {
    var db = await SQLTEDatabase().obterDB();

    await db.transaction(
      (txn) async {
        await txn.rawInsert(
          'INSERT INTO contatos (name, sobreName, apelido, telefone, email, dataNascimento, informacoes, imageUrl) VALUES(?, ?, ?, ?, ?, ?, ?, ?)',
          [
            contatosModel.nome,
            contatosModel.sobreName,
            contatosModel.apelido,
            contatosModel.telefone,
            contatosModel.email,
            contatosModel.dataNascimento,
            contatosModel.informacoes,
            contatosModel.imageUrl
          ],
        );
      },
    );
  }

  Future<void> editarListaContatos(ContatosModel contatosModel) async {
    var db = await SQLTEDatabase().obterDB();

    await db.transaction(
      (txn) async {
        await txn.rawUpdate(
          'UPDATE contatos SET name = ?, sobreName = ?, apelido = ?, telefone = ?, email = ?, dataNascimento = ?, informacoes = ?, imageUrl = ? WHERE id = ?',
          [
            contatosModel.nome,
            contatosModel.sobreName,
            contatosModel.apelido,
            contatosModel.telefone,
            contatosModel.email,
            contatosModel.dataNascimento,
            contatosModel.informacoes,
            contatosModel.imageUrl,
            contatosModel.id
          ],
        );
      },
    );
  }

  Future<void> apagarContato(int id) async {
    var db = await SQLTEDatabase().obterDB();

    await db.transaction(
      (txn) async {
        txn.rawDelete('DELETE FROM contatos WHERE id = ?', [id]);
      },
    );
  }
}
