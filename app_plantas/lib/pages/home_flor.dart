// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import '../models/flor.dart';
// ignore: unused_import
import 'flor_page.dart';
import 'home_controller.dart';

class HomeFlor extends StatefulWidget {
  const HomeFlor({super.key});

  @override
  State<HomeFlor> createState() => _HomeFlorState();
}

class _HomeFlorState extends State<HomeFlor> {
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
          'App Plantas',
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
          final List<Flor> danilo = controller.danilo;
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
              Navigator.push(context, MaterialPageRoute(builder: (_) => FlorPage(
                key: Key(danilo[flor].nome),
                flor: danilo[flor],)
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
