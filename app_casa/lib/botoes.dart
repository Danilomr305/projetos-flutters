// ignore: unused_import
import 'package:flutter/material.dart';



class Bottes extends StatefulWidget {
  const Bottes({super.key});

  @override
  State<Bottes> createState() => _BottesState();
}

class _BottesState extends State<Bottes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
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
        )
      ),
    );
  }
}