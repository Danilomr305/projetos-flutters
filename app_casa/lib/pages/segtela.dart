// ignore: unused_import
import 'package:app_casa/pages/casa_page.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import '../models/casa.dart';
// ignore: unused_import
import 'home_controller.dart';

class HomeCasa extends StatefulWidget {
  const HomeCasa({super.key});

  @override
  State<HomeCasa> createState() => _HomeCasaState();
}

class _HomeCasaState extends State<HomeCasa> {
  // ignore: prefer_typing_uninitialized_variables
  var controller;

  @override
  void initState() { 
    super.initState(); 
    controller = Home();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Atividades de Casa',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            fontFamily: AutofillHints.birthday,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: controller.danilo.length,
        itemBuilder: (BuildContext context, int flor){
          final List<Casa> danilo = controller.danilo;
          return ListTile(
            leading: 
              Image.network(
                danilo[flor].brasao
              ),

            title: 
            Text(
              danilo[flor].nome.toString(),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CasaPage(
                key: Key(danilo[flor].nome),
                casa: danilo[flor],)
                ),
              );
            },  
          );
        }, 
        separatorBuilder: (_, __) => const Divider(),
        padding: const EdgeInsets.all(16),   
      ),
    );
  }
}