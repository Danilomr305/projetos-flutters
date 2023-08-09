import 'package:flutter/material.dart';
// ignore: unused_import
import 'helper.dart';

void main() => runApp(const Plantas());


class Plantas extends StatelessWidget {
  const Plantas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Clima(),
    );
  }
}

Helper helper = Helper();

class Clima extends StatefulWidget {
  const Clima({super.key});

  @override
  State<Clima> createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'imagem/fundo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          constraints: const BoxConstraints.expand(),
        child:  SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Card(
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(
                    vertical: 15.0,   
                    horizontal: 35.0, 
                  ),  
                    child:    
                      Text(
                        'OLÁ AMANTES DE PLANTAS!',
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),  
                  ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Text(
                      helper.getFrases(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                        backgroundColor: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          helper.nextFrase(1);
                        });
                      },  
                      child: Text(
                        helper.getChoice1(),
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Visibility(
                      visible: helper.buttonShouldBeVisible(), 
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            helper.nextFrase(2);
                          });
                        },
                        child: Text(
                          helper.getChoice2(),
                          style: const TextStyle(
                            fontSize: 20.0
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            )
        ),
      );
  }
}