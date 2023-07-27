import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Social Midia',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w900,
          ),
          ),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: const Social(),
      ),
    ),
  );
}


class Social extends StatefulWidget {
  const Social({super.key});

  @override
  State<Social> createState() => _SocialState();
}
 
class _SocialState extends State<Social> {
  int fotosTela = 1;

  void alterarFotos () { 
    setState(() {
      fotosTela = Random().nextInt(2) +1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold( 
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  <Widget>[
                const Padding(
                  padding: EdgeInsets.all(15.0), 
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('imagen/perfil.jpg'),
                  radius: 50.0,  
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Danilo Martins',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'DESENVOLVEDOR FLUTTER',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.w900, 
                  ),
                ),
                const SizedBox( 
                  height: 15.0,
                  width: 250.0,
                 child: Divider(
                  color: Colors.white,
                 ),
                ),
                const Card(
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,   
                    horizontal: 25.0, 
                  ),
                    child: ListTile(
                      leading:
                        Icon(Icons.phone_callback,
                        size: 25.0,
                        color: Colors.blue,
                        ),
                      title:    
                        Text('+55 1234-2345',
                          style: TextStyle(
                            color: Colors.blue, 
                            fontFamily: 'Pacifico',
                            fontSize: 20.0
                          ),
                        ),
                    ),
                ),
                const Card(
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                    child: ListTile(
                      leading:
                        Icon(Icons.mail_lock_rounded,
                        size: 25.0,
                        color: Colors.blue,
                        ),
                      title:    
                        Text('danilomr305@gmail.com',
                          style: TextStyle(
                            color: Colors.blue, 
                            fontFamily: 'Pacifico', 
                            fontSize: 20.0
                          ),
                        ),
                    ),
                ),
              Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                      onPressed: (){
                        alterarFotos();
                        },
                      child: Image.asset(
                        'imagens/tela$fotosTela.jpg',
                        height: 350.0,),
                      ),
                    ),
                  ],
                ),
              ),
              ],
              ),
          ),
          ),
      ),
    );
  } 
}

  