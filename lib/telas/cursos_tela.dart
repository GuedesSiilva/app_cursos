import 'package:flutter/material.dart';
import '../models/curso.dart';
import '../widgets/curso_card.dart';

class CursosTela extends StatefulWidget {
  const CursosTela({super.key});

  @override
  State<CursosTela> createState() => _CursosTelaState();
}

class _CursosTelaState extends State<CursosTela> {
  final TextEditingController _controllerPesquisa = TextEditingController();
  String _termoPesquisa = '';

  @override
  void dispose() {
    _controllerPesquisa.dispose();
    super.dispose();
  }

  void _alternarFavorito(Curso curso) {
    setState(() {
      curso.favorito = !curso.favorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cursosFiltrados = cursosMock.where((curso) {
      return curso.nome.toLowerCase().contains(_termoPesquisa.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cursos'),
      ),
      body: Column(
        children: [
          // PARTE 5 - Barra de pesquisa
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controllerPesquisa,
              onChanged: (valor) {
                setState(() {
                  _termoPesquisa = valor;
                });
              },
              decoration: InputDecoration(
                hintText: 'Pesquisar curso',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: cursosFiltrados.isEmpty
                ? const Center(child: Text('Nenhum curso encontrado.'))
                : ListView.builder(
                    itemCount: cursosFiltrados.length,
                    itemBuilder: (context, index) {
                      final curso = cursosFiltrados[index];
                      return CursoCard(
                        curso: curso,
                        onFavoritar: () => _alternarFavorito(curso),
                        onContinuar: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Abrindo curso: ${curso.nome}'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
