import 'package:flutter/material.dart';
import '../models/curso.dart';
import '../widgets/curso_card.dart';

class FavoritosTela extends StatefulWidget {
  const FavoritosTela({super.key});

  @override
  State<FavoritosTela> createState() => _FavoritosTelaState();
}

class _FavoritosTelaState extends State<FavoritosTela> {
  void _removerFavorito(Curso curso) {
    setState(() {
      curso.favorito = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoritos = cursosMock.where((c) => c.favorito).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: favoritos.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite_border, size: 56, color: Colors.grey[400]),
                  const SizedBox(height: 12),
                  Text(
                    'Você ainda não favoritou nenhum curso.',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final curso = favoritos[index];
                return CursoCard(
                  curso: curso,
                  onFavoritar: () => _removerFavorito(curso),
                );
              },
            ),
    );
  }
}
