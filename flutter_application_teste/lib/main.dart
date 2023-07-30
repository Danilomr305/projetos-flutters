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
              onPressed: () async {
                final player = AudioPlayer();
                await player.play(UrlSource('https://www.youtube.com/watch?v=5oJXSpr76vA'));
              }, 
              child:  const Text('Clique em mim!'),
            ),
          ), 
        ),
      ), 
    );
  }
}