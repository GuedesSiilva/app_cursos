import 'package:flutter/material.dart';
import '../models/curso.dart';

/// Componente reutilizável para exibir um curso.
/// Usado nas telas de Cursos, Favoritos e Início.
class CursoCard extends StatelessWidget {
  final Curso curso;
  final VoidCallback? onFavoritar;
  final VoidCallback? onContinuar;
  final bool mostrarProgresso;

  const CursoCard({
    super.key,
    required this.curso,
    this.onFavoritar,
    this.onContinuar,
    this.mostrarProgresso = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor:
                      theme.colorScheme.primary.withOpacity(0.15),
                  child: Icon(curso.icone, color: theme.colorScheme.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        curso.nome,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${curso.totalAulas} aulas',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (onFavoritar != null)
                  IconButton(
                    icon: Icon(
                      curso.favorito ? Icons.favorite : Icons.favorite_border,
                      color: curso.favorito ? Colors.redAccent : Colors.grey,
                    ),
                    onPressed: onFavoritar,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              curso.descricao,
              style: TextStyle(color: Colors.grey[700], fontSize: 13),
            ),
            if (mostrarProgresso) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: curso.progresso,
                  minHeight: 8,
                  backgroundColor: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${curso.aulasConcluidas} de ${curso.totalAulas} aulas concluídas',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
            if (onContinuar != null) ...[
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: onContinuar,
                  icon: const Icon(Icons.play_arrow, size: 18),
                  label: const Text('Continuar curso'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
