import 'package:flutter/material.dart';

/// PARTE 14 - DESAFIO
/// Funcionalidade adicional criada além do que foi visto em aula:
/// uma tela "Sobre o aplicativo" com informações do projeto.
class SobreTela extends StatelessWidget {
  const SobreTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o aplicativo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.flutter_dash,
              size: 64,
              color: const Color.fromARGB(255, 6, 143, 125),
            ),
            const SizedBox(height: 16),
            const Text(
              'App de Cursos',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Versão 1.0.0',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              'Aplicativo desenvolvido em Flutter como atividade prática de '
              'organização de projeto, navegação entre telas, listas, '
              'formulários e componentes reutilizáveis.',
              style: TextStyle(fontSize: 15, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
