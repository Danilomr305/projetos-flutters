// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: unused_import
import '../models/moeda.dart';
// ignore: unused_import
import '../pages/moedas_detalhes_page.dart';
// ignore: unused_import
import '../repositories/favoritas_repository.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class MoedaCard extends StatefulWidget {
  Moeda moeda;

  MoedaCard({
    Key? key,
    required this.moeda,
  }) : super(key: key);

  

  @override
  State<MoedaCard> createState() => _MoedaCardState();
}

class _MoedaCardState extends State<MoedaCard > {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  // ignore: unused_field
  static Map<String, Color> precoColor = <String, Color> {
    'up': Colors.teal,
    'down': Colors.indigo
  };

  abrirDetalhes() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (_) => MoedasDetalhesPage(moeda: widget.moeda),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 20,
        ),
        child: Row(
          children: [
            Image.asset(
              widget.moeda.icone,
              height: 40,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.moeda.nome,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      widget.moeda.sigla,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black45
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20
              ),
              decoration: BoxDecoration(
                color: precoColor['down']!.withOpacity(0.05),
                border: Border.all(
                  color: precoColor['down']!.withOpacity(0.04),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                real.format(widget.moeda.preco),
                style: TextStyle(
                  fontSize: 16,
                  color: precoColor['down'],
                  letterSpacing: -1,
                ),
              ),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: ListTile(
                    title: const Text(
                      'Remover das Favoritas',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Provider.of<FavoritasRepository>(context, listen: false)
                      .remove(widget.moeda);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Provider {
}