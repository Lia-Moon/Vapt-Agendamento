import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:vapt_agendamento/modules/home/home_page.dart';
import 'package:vapt_agendamento/core/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vapt App',
      debugShowCheckedModeBanner: false, // Remove a faixa de "Debug" no canto da tela
      theme: defaultTheme,
      home: const HomePage(), // Aqui você define qual tela abre primeiro
    );
  }
}