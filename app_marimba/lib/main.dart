 import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MarimbaApp());
}

class MarimbaApp extends StatelessWidget {
  const MarimbaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(  
        body: SafeArea(
          child: Center( 
            child: TextButton(
              onPressed: () {
                final player = AudioPlayer();
                player.play(('toque/nota1.wav'),
                );
              }, 
              child:  const Text('Clique em mim!'),
            ),
          ), 
        ),
      ), 
    );
  }
}