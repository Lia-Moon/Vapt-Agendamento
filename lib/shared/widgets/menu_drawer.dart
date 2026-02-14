import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: Text('Menu Vapt', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início'),
            textColor: Theme.of(context).colorScheme.onSurfaceVariant,
            iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            textColor: Theme.of(context).colorScheme.onSurfaceVariant,
            iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}