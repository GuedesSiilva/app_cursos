import 'package:flutter/material.dart';
import '../models/curso.dart';
import 'editar_perfil_tela.dart';
import 'sobre_tela.dart';

class PerfilTela extends StatefulWidget {
  const PerfilTela({super.key});

  @override
  State<PerfilTela> createState() => _PerfilTelaState();
}

class _PerfilTelaState extends State<PerfilTela> {
  String _nome = 'Estudante Flutter';
  String _email = 'estudante@email.com';

  Future<void> _abrirEditarPerfil() async {
    // PARTE 11 - Navegação para Editar Perfil
    final resultado = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => EditarPerfilTela(
          nomeAtual: _nome,
          emailAtual: _email,
        ),
      ),
    );

    if (resultado != null) {
      setState(() {
        _nome = resultado['nome'] ?? _nome;
        _email = resultado['email'] ?? _email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cursoAtual = cursosMock.firstWhere(
      (c) => c.aulasConcluidas > 0 && c.aulasConcluidas < c.totalAulas,
      orElse: () => cursosMock.first,
    );
    final totalConcluidos =
        cursosMock.where((c) => c.aulasConcluidas == c.totalAulas).length;
    final totalAulasConcluidas =
        cursosMock.fold<int>(0, (soma, c) => soma + c.aulasConcluidas);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Sobre o aplicativo',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SobreTela()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: CircleAvatar(
              radius: 48,
              backgroundColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.15),
              child: Icon(
                Icons.person,
                size: 54,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              _nome,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              _email,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.menu_book_outlined),
                  title: const Text('Curso atual'),
                  subtitle: Text(cursoAtual.nome),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.library_books_outlined),
                  title: const Text('Quantidade de cursos'),
                  subtitle: Text('${cursosMock.length} cursos'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.check_circle_outline),
                  title: const Text('Cursos concluídos'),
                  subtitle: Text('$totalConcluidos cursos'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.play_lesson_outlined),
                  title: const Text('Aulas concluídas'),
                  subtitle: Text('$totalAulasConcluidas aulas'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _abrirEditarPerfil,
            icon: const Icon(Icons.edit),
            label: const Text('Editar perfil'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}
