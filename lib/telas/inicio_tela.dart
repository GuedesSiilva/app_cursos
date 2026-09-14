import 'package:flutter/material.dart';
import '../models/curso.dart';
import '../widgets/curso_card.dart';

class InicioTela extends StatelessWidget {
  const InicioTela({super.key});

  @override
  Widget build(BuildContext context) {
    final cursoEmAndamento = cursosMock.firstWhere(
      (c) => c.aulasConcluidas > 0 && c.aulasConcluidas < c.totalAulas,
      orElse: () => cursosMock.first,
    );

    final totalIniciados = cursosMock.where((c) => c.aulasConcluidas > 0).length;
    final totalConcluidos =
        cursosMock.where((c) => c.aulasConcluidas == c.totalAulas).length;
    final totalAulasConcluidas =
        cursosMock.fold<int>(0, (soma, c) => soma + c.aulasConcluidas);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Início'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          // Cabeçalho com saudação
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Olá, estudante!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Continue evoluindo nos seus estudos hoje.',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Seção 1: Curso em andamento
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Curso em andamento',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          CursoCard(curso: cursoEmAndamento, mostrarProgresso: true),

          const SizedBox(height: 16),

          // Seção 2: Resumo do estudante
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Resumo do estudante',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _ResumoItem(titulo: 'Iniciados', valor: '$totalIniciados'),
                const SizedBox(width: 10),
                _ResumoItem(titulo: 'Concluídos', valor: '$totalConcluidos'),
                const SizedBox(width: 10),
                _ResumoItem(titulo: 'Aulas feitas', valor: '$totalAulasConcluidas'),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Seção 3: Cursos disponíveis
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Cursos disponíveis',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...cursosMock
              .where((c) => c.aulasConcluidas == 0)
              .map((c) => CursoCard(curso: c)),
        ],
      ),
    );
  }
}

class _ResumoItem extends StatelessWidget {
  final String titulo;
  final String valor;

  const _ResumoItem({required this.titulo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              valor,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              titulo,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
