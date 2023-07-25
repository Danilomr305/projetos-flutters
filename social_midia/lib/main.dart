import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Social Midia'),
          backgroundColor: Colors.blue.shade800,
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
  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('imagens/perfil.jpg'),
                radius: 50.0,  
              ),
              Text(
                'Danilo Martins',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'DESENVOLVEDOR FLUTTER',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w900,
                ),
              ),
                 SizedBox(
                height: 30.0,
                width: 250.0,
               child: Divider(
                color: Colors.white,
               ),
              ),
             // ignore: avoid_unnecessary_containers
              Card(
                color: Colors.black,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                  child: ListTile(
                    leading:
                      Icon(Icons.phone,
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
            ],
            ),
          ),
      ),
    );
  }
}


