// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> playSound(int number) async {
    final player = AudioPlayer();
    ByteData bytes = await rootBundle
        .load("assets/note$number.wav"); //load audio from assets
    Uint8List audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    await player.playBytes(audiobytes);
  }

  Widget buildkey(int n, Color c) {
    return Expanded(
      child: FlatButton(
        color: c,
        onPressed: () {
          playSound(n);
        },
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildkey(1, Colors.red),
              buildkey(2, Colors.orange),
              buildkey(3, const Color(0xFF990000)),
              buildkey(4, const Color(0xFF3C2C3E)),
              buildkey(5, const Color(0xFFD4D925)),
              buildkey(6, const Color(0xFF00FFAB)),
              buildkey(7, const Color(0xFFEC994B)),
            ],
          ),
        ),
      ),
    );
  }
}
