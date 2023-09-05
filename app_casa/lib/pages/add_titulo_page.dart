// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import '../models/atividade.dart';
// ignore: unused_import
import '../models/casa.dart';

// ignore: must_be_immutable
class AddTituloPage extends StatefulWidget {
  Casa casa;
  ValueChanged<Atividade> onSave;
   AddTituloPage({
    Key? key,
    required this.casa,
    required this.onSave,
  }) :super(key: key);
  

  @override
  State<AddTituloPage> createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {

  final _tempo = TextEditingController();
  final _caracteristica = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CONCLUSÃO'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
                controller: _tempo,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Quem fez essa atividade?',
                ),
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o seu nome!';
                  }
                  return null;
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24),
              child: TextFormField(
                controller: _caracteristica,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Qual dia da Semana?'
                ),
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o dia da semana que você fes essa atividade!';
                  }
                  return null;
                }
              ),
            ),
            Expanded(
              child: 
              Container(
                alignment: Alignment.bottomCenter,
                margin:  const EdgeInsets.all(24.0),
                child:
                ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      widget.onSave(
                        Atividade(
                          Problema: _tempo.text
                          , 
                          Caracteristicas: _caracteristica.text
                        )
                      );
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Salvar',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w900,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}