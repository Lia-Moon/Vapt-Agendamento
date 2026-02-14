import 'package:flutter/material.dart';
import 'package:vapt_agendamento/shared/widgets/menu_drawer.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      
      drawer: const MenuDrawer(),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cofigurações',
                    style: TextStyle(
                      fontSize: 32,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'Cursive', 
                    ),
                  ),
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
          ]
        ),
      ),
    );
  }
}