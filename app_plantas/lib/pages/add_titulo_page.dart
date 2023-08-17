// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import '../models/flor.dart';
// ignore: unused_import
import '../models/titulo.dart';

// ignore: must_be_immutable
class AddTituloPage extends StatefulWidget {
  Flor flor;
  ValueChanged<Titulo> onSave;
  AddTituloPage({
    Key? key,
    required this.flor,
    required this.onSave,

  }) :super(key: key);

  @override
  State<AddTituloPage> createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  
  final _tempo = TextEditingController();
  final _caracteristica = TextEditingController();
  final _formKey  = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Adicionando Caracteristica'),
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
                  labelText: 'Altura da Planta'
                ),
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe a altura da Planta!';
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
                  labelText: 'Caracteristicas'
                ),
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe as caracteristicas da Planta!';
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
                        Titulo(
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
                      Icon(
                        Icons.check
                      ),
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
        )),
    );
  }
}