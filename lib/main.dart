import 'package:flutter/material.dart';
import 'package:vapt_agendamento/modules/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vapt App',
      debugShowCheckedModeBanner: false, // Remove a faixa de "Debug" no canto da tela
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFF90B9BF), // Define a cor principal do app
      ),
      home: const HomePage(), // Aqui você define qual tela abre primeiro
    );
  }
}