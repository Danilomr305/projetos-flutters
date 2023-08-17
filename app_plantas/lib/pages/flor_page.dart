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
  // ignore: prefer_typing_uninitialized_variables
  var addTitulo;

  // ignore: prefer_typing_uninitialized_variables
  

  // ignore: prefer_typing_uninitialized_variables
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
    }}
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}