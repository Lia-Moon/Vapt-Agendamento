import 'package:flutter/material.dart';
import 'package:vapt_agendamento/modules/reminder/add_reminder.dart';
import '../../shared/widgets/menu_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Cor de fundo do topo (azul acinzentado)
      backgroundColor: const Color(0xFF90B9BF),
      
      endDrawer: const MenuDrawer(),

      // 3. O corpo da tela
      body: SafeArea(
        child: Column(
          children: [
            // Cabeçalho Customizado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Vapt',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'Cursive', // Certifique-se de configurar a fonte no pubspec
                    ),
                  ),
                  // Botão que abre o Drawer
                  Builder(
                    builder: (context) => IconButton(
                      icon:
                          const Icon(Icons.menu, color: Colors.white, size: 30),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF0F0F0), // Cinza muito claro
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Vazio aqui',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF90B9BF),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Que tal adicionar seu\nprimeiro lembrete?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 5. Botão Flutuante (FAB)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => const AddReminder(),
            ),
          ); 
        }, 
        backgroundColor: const Color(0xFF90B9BF),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
