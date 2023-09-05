// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import '../models/atividade.dart';
// ignore: unused_import
import '../models/casa.dart';

import '../pages/add_titulo_page.dart';

// ignore: must_be_immutable
class CasaPage extends StatefulWidget {
  Casa casa;
  // ignore: use_key_in_widget_constructors
  CasaPage({ 
    Key? key,
    required this.casa,
  }) : super(key: key);

  @override
  State<CasaPage> createState() => _CasaPageState();
}

class _CasaPageState extends State<CasaPage> {
 

  tituloPage() {
  
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddTituloPage(
          casa: widget.casa, 
          // ignore: unnecessary_this
          onSave: this.addTitulo),
      ),
    );
  }
     
    // ignore: unused_element
    addTitulo(Atividade titulo) {
      setState(() {
        widget.casa.titulo.add(titulo);
      });

      Navigator.pop(context);

      ScaffoldMessenger.of(context).
        showSnackBar(const SnackBar(content: Text('Salva com sucesso')));
    }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:  Text(widget.casa.nome),
          actions: [IconButton(
            icon: const Icon(Icons.add),
            onPressed: tituloPage,),
          ],
          bottom: const TabBar(tabs: [
           Tab(
             icon: Icon(Icons.stacked_line_chart),
             text: 'Atividade',
           ),
           Tab(
             icon: Icon(Icons.stacked_line_chart),
             text: 'Conclusão',
           ),
          ],
          indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [ 
            Column(   
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(  
                  padding: const EdgeInsets.all(24),
                  child: Image.network(widget.casa.brasao.replaceAll("40x40", "41x41"), 
                  ),
                ),
                Text(
                  // ignore: unnecessary_string_interpolations
                  '${widget.casa.nome}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            titulos()
          ]),
      ),
    );
  }
  Widget titulos() {

    final quantidade = widget.casa.titulo.length;

    return quantidade == 0
           // ignore: avoid_unnecessary_containers
           ? Container(
            child:  const Center(
              child: Text('Nenhuma caracteristica ainda!'),
              ),
            )
          : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return  ListTile(
                leading: const Icon(Icons.emoji_events_outlined),
                title: Text(widget.casa.titulo[index].Caracteristicas),
                trailing: Text(widget.casa.titulo[index].Problema),
              );
            },
            separatorBuilder: (_,__) => const Divider(), 
            itemCount: quantidade
          );
  }
}