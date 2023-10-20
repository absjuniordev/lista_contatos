import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ContatosModel {
  int _id = 0;
  String _name = "";
  String _sobreName = "";
  String _apelido = "";
  String _telefone = "";
  String _email = "";
  String _dataNascimento = "";
  String _informacoes = "";
  String? _imageUrl;
  ContatosModel(
    this._id,
    this._name,
    this._sobreName,
    this._apelido,
    this._telefone,
    this._email,
    this._dataNascimento,
    this._informacoes,
    this._imageUrl,
  );
  int get id => _id;
  String get nome => _name;
  String get sobreName => _sobreName;
  String get apelido => _apelido;
  String get telefone => _telefone;
  String get email => _email;
  String get dataNascimento => _dataNascimento;
  String get informacoes => _informacoes;
  String get imageUrl => _imageUrl!;

  set id(int id) => _id = id;
  set nome(String nome) => _name = nome;
  set sobreName(String sobreName) => _sobreName = sobreName;
  set apelido(String apelido) => _apelido = apelido;
  set telefone(String telefone) => _telefone = telefone;
  set email(String email) => _email = email;
  set dataNascimento(String dataNascimento) => _dataNascimento = dataNascimento;
  set informacoes(String informacoes) => _informacoes = informacoes;
  set imageUrl(String imagem) => _imageUrl = imagem;

  @override
  String toString() {
    return 'ContatosModel(_id: $_id, _name: $_name, _sobreName: $_sobreName, _apelido: $_apelido, _telefone: $_telefone, _email: $_email, _dataNascimento: $_dataNascimento, _informacoes: $_informacoes, _imageUrl: $_imageUrl)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': _id,
      '_name': _name,
      '_sobreName': _sobreName,
      '_apelido': _apelido,
      '_telefone': _telefone,
      '_email': _email,
      '_dataNascimento': _dataNascimento,
      '_informacoes': _informacoes,
      '_imageUrl': _imageUrl,
    };
  }

  factory ContatosModel.fromMap(Map<String, dynamic> map) {
    return ContatosModel(
      map['_id'] as int,
      map['_name'] as String,
      map['_sobreName'] as String,
      map['_apelido'] as String,
      map['_telefone'] as String,
      map['_email'] as String,
      map['_dataNascimento'] as String,
      map['_informacoes'] as String,
      map['_imageUrl'] != null ? map['_imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContatosModel.fromJson(String source) =>
      ContatosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
