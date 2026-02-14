import 'package:flutter/material.dart';
import 'package:vapt_agendamento/shared/widgets/menu_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      
      drawer: const MenuDrawer(),

      // page body
      body: SafeArea(
        child: Column(
          children: [
            // customized header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vapt',
                    style: TextStyle(
                      fontSize: 32,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'Cursive', 
                    ),
                  ),
                  // Button that opens Drawer
                  Builder(
                    builder: (context) => IconButton(
                      icon:
                          Icon(Icons.menu, color: Theme.of(context).colorScheme.onPrimary, size: 30),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surfaceContainerHighest, // background that uses a very light tone from the primary color
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Vazio aqui',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Que tal adicionar seu\nprimeiro lembrete?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant,
                                      fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating button (FAB)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add reminder
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary, size: 30),
      ),
    );
  }
}
