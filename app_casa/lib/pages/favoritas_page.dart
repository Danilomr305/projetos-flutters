// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
// ignore: unused_import
import '../widgets/casa_card.dart';
// ignore: unused_import
import '../repositories/favoritas_repository.dart';

class FavoritasPage extends StatefulWidget {
  const FavoritasPage({super.key});

  @override
  State<FavoritasPage> createState() => _FavoritasPageState();
}

class _FavoritasPageState extends State<FavoritasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prioridades do Dia'),
      ),
      body: Container(
        color: Colors.indigo.withOpacity(0.05),
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12.0),
        child: Consumer<FavoritasRepository>(
          builder: (context, prioridades, child) {
            return prioridades.lista.isEmpty
            ? const ListTile(
              leading: Icon(Icons.book_online_outlined),
              title: Text('Ainda não há prioridades do dia!'),
            )
            :
            ListView.builder(
              itemCount: prioridades.lista.length,
              itemBuilder: (_, index) {
                return CasaCard(casa: 
                prioridades.lista[index]);
              }
            );
          },
        ),
      ),
    );
  }
}