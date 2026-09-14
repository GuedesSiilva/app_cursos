import 'package:flutter/material.dart';

/// Modelo simples que representa um curso do aplicativo.
/// Mantido em memória (sem persistência) para fins didáticos.
class Curso {
  final String nome;
  final String descricao;
  final int totalAulas;
  final int aulasConcluidas;
  final IconData icone;
  bool favorito;

  Curso({
    required this.nome,
    required this.descricao,
    required this.totalAulas,
    this.aulasConcluidas = 0,
    this.icone = Icons.school,
    this.favorito = false,
  });

  double get progresso =>
      totalAulas == 0 ? 0 : aulasConcluidas / totalAulas;
}

/// Lista inicial de cursos (dados mockados).
/// Fica aqui para ser compartilhada entre as telas (Início, Cursos, Favoritos).
List<Curso> cursosMock = [
  Curso(
    nome: 'Flutter Básico',
    descricao:
        'Curso introdutório sobre desenvolvimento mobile utilizando Flutter.',
    totalAulas: 12,
    aulasConcluidas: 8,
    icone: Icons.flutter_dash,
    favorito: true,
  ),
  Curso(
    nome: 'Dart Essencial',
    descricao: 'Fundamentos da linguagem Dart para quem está começando.',
    totalAulas: 10,
    aulasConcluidas: 10,
    icone: Icons.code,
    favorito: true,
  ),
  Curso(
    nome: 'Interface Mobile',
    descricao: 'Construção de interfaces responsivas e componentes visuais.',
    totalAulas: 8,
    aulasConcluidas: 3,
    icone: Icons.phone_iphone,
    favorito: true,
  ),
  Curso(
    nome: 'Conexão com API',
    descricao: 'Como consumir APIs REST em aplicativos Flutter.',
    totalAulas: 9,
    aulasConcluidas: 0,
    icone: Icons.api,
  ),
  Curso(
    nome: 'Banco de Dados',
    descricao: 'Armazenamento local de dados utilizando SQLite.',
    totalAulas: 11,
    aulasConcluidas: 2,
    icone: Icons.storage,
  ),
  Curso(
    nome: 'Desenvolvimento Mobile',
    descricao: 'Boas práticas e arquitetura de projetos mobile.',
    totalAulas: 14,
    aulasConcluidas: 0,
    icone: Icons.smartphone,
  ),
];
