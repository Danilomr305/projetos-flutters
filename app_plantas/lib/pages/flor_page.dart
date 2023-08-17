// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import '../models/titulo.dart';
// ignore: unused_import
import '../models/flor.dart';
// ignore: unused_import
import '../pages/add_titulo_page.dart';

// ignore: must_be_immutable
class FlorPage extends StatefulWidget {
  Flor flor;
  // ignore: use_key_in_widget_constructors
  FlorPage({ 
    Key? key,
    required this.flor,
  }) : super(key: key);

  @override
  State<FlorPage> createState() => _FlorPageState();
}

class _FlorPageState extends State<FlorPage> {
 

  tituloPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddTituloPage(
          flor: widget.flor, 
          // ignore: unnecessary_this
          onSave: this.addTitulo),
      ),
    );

    // ignore: unused_element
    addTitulo(Titulo titulo) {{
      setState(() {
        widget.flor.titulo.add(titulo);
      });

      Navigator.pop(context);

      ScaffoldMessenger.of(context).
        showSnackBar(const SnackBar(content: Text('Salva com sucesso')));
    }}
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.flor.cor,
          title:  Text(widget.flor.nome),
          actions: [IconButton(
            icon: const Icon(Icons.add),
            onPressed: tituloPage,),
          ],
          bottom: const TabBar(tabs: [
           Tab(
             icon: Icon(Icons.stacked_line_chart),
             text: 'Planta',
           ),
           Tab(
             icon: Icon(Icons.stacked_line_chart),
             text: 'Caracteristica',
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
                  child: Image.network(widget.flor.brasao.replaceAll("40x40", "100x100"),
                  ),
                ),
                Text(
                  // ignore: unnecessary_string_interpolations
                  '${widget.flor.nome}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
            titulos()
          ]),
      ),
    );
  }
  Widget titulos() {

    final quantidade = widget.flor.titulo.length;

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
                title: Text(widget.flor.titulo[index].Caracteristicas),
                trailing: Text(widget.flor.titulo[index].Problema),
              );
            },
            separatorBuilder: (_,__) => const Divider(), 
            itemCount: quantidade
          );
  }
}