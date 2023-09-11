// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore: unused_import
import '../models/casa.dart';
// ignore: unused_import
import '../repositories/favoritas_repository.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CasaCard extends StatefulWidget {
  Casa casa;

  CasaCard({
    Key? key,
    required this.casa
  }) : super(key: key);

  

  @override
  State<CasaCard> createState() => _CasaCardState();
}

class _CasaCardState extends State<CasaCard> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR',
  name: 'Casa');

  // ignore: unused_field
  static Map<String, Color> preColor = <String, Color> {
    'up' : Colors.teal,
    'down': Colors.indigo   
  };

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
              widget.casa.brasao,
              height: 40,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.casa.nome,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black45
                      ),
                    ),
                    Text(
                      widget.casa.brasao,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black45
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: preColor['down']!.withOpacity(0.05),
                border: Border.all(
                  color: preColor['down']!.withOpacity(0.04),
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                real.format(widget.casa.nome),
                style: TextStyle(
                  fontSize: 16,
                  color: preColor['down'],
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
                      'Remover das prioridades',
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Provider.of<FavoritasRepository>
                      (context, listen: false);
                    },
                  ))
              ]
            ),
          ],
        ),
      ),
    );
  }
}