# 📚 App de Cursos — Flutter

Aplicativo mobile desenvolvido em **Flutter** como atividade prática de evolução de projeto, com foco em organização de código, navegação entre telas, listas dinâmicas e componentes reutilizáveis.

## ✨ Funcionalidades

- **Início** — saudação personalizada, curso em andamento com barra de progresso, resumo do estudante (cursos iniciados, concluídos e aulas feitas) e lista de cursos disponíveis.
- **Cursos** — lista completa de cursos com nome, descrição, quantidade de aulas e ícone; barra de pesquisa em tempo real; opção de favoritar.
- **Favoritos** — exibe apenas os cursos marcados como favoritos.
- **Perfil** — dados do usuário (nome, e-mail, curso atual, cursos concluídos, aulas concluídas) com opção de edição.
- **Editar Perfil** — formulário para atualizar nome e e-mail.
- **Sobre o aplicativo** — informações gerais sobre o app.

## 🛠️ Tecnologias

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- Material 3 (`useMaterial3: true`)

## 📁 Estrutura do projeto

```
lib/
├── main.dart                  # Inicialização, tema e navegação (menu inferior)
├── models/
│   └── curso.dart             # Modelo Curso + lista de cursos
├── telas/
│   ├── inicio_tela.dart
│   ├── cursos_tela.dart
│   ├── favoritos_tela.dart
│   ├── perfil_tela.dart
│   ├── editar_perfil_tela.dart
│   └── sobre_tela.dart
└── widgets/
    └── curso_card.dart        # Componente reutilizável de exibição de curso
```

## 🚀 Como rodar o projeto

**Pré-requisitos:** [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado.

```bash
# Clone o repositório
git clone https://github.com/GuedesSiilva/app_cursos.git
cd app_cursos

# Instale as dependências
flutter pub get

# Rode o app (emulador, dispositivo físico ou web)
flutter run
```

## 📱 Conceitos praticados

- `StatefulWidget` e `setState`
- `ListView` / `ListView.builder`
- `Card`, `ListTile`, `TextField`, `ElevatedButton`, `IconButton`
- Navegação com `Navigator.push()` / `Navigator.pop()`
- Filtragem dinâmica de listas
- Componentização e reutilização de widgets
- Tema personalizado (`ThemeData`, `ColorScheme`)

## 📌 Status

Projeto em desenvolvimento contínuo como parte de atividade acadêmica.

## 👤 Autor

Desenvolvido por [GuedesSiilva](https://github.com/GuedesSiilva).
