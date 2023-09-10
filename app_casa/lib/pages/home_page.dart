// ignore: unused_import
import 'package:app_casa/pages/segtela.dart';

// ignore: unused_import
import '../pages/casa_page.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'favoritas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller:  pc,
        onPageChanged: setPaginaAtual,
        children: const [
          HomeCasa(),
          FavoritasPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Atividades'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online_outlined),
            label: 'Pr do Dia'
          ),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease
          );
        },
        backgroundColor: Colors.blue.shade50,
      ),
    );
  }
}