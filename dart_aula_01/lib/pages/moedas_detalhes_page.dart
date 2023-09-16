import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../models/moeda.dart';

// ignore: must_be_immutable
class MoedasDetalhesPage extends StatefulWidget {
  Moeda moeda;
  MoedasDetalhesPage({
    Key? key,
    required this.moeda,
  }) : super(key: key);

  @override
  State<MoedasDetalhesPage> createState() => _MoedasDetalhesPageState();
}

class _MoedasDetalhesPageState extends State<MoedasDetalhesPage> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  double quatidade = 0;

  comprar() {
    if(_form.currentState!.validate()) {


      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Comprar realizada com sucesso!'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moeda.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      child: Image.asset(widget.moeda.icone),
                    ),
                    Container(width: 10),
                    Text(
                      real.format(widget.moeda.preco),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              (quatidade > 0 )
              ? SizedBox(
                width: MediaQuery.of(context).size.width,
                // ignore: avoid_unnecessary_containers
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  padding: const EdgeInsets.all(6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                   color: Colors.tealAccent.withOpacity(0.25),
                  ),
                  child: Text(
                    '$quatidade ${widget.moeda.sigla}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                ),
              )
              : Container(
                margin: const EdgeInsets.only(bottom: 24),
              ),
              Form(
                key: _form,
                child: TextField(
                  controller: _valor,
                  style: const TextStyle(fontSize: 22),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Valor',
                    prefixIcon: Icon(Icons.monetization_on_outlined),
                    suffix: Text(
                      'reais',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    setState(() {
                      quatidade = (value.isEmpty)
                        ? 0
                        : double.parse(value) / widget.moeda.preco;
                    });
                  },
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(top: 24),
                child:ElevatedButton(
                  onPressed: comprar,
                  child: const Text('COMPRAR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
