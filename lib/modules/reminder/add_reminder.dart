import 'package:flutter/material.dart';
import 'package:vapt_agendamento/shared/widgets/menu_drawer.dart';

class AddReminder extends StatelessWidget {
  const AddReminder({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      
      endDrawer: const MenuDrawer(),

      // page body
      body: SafeArea(
        child: Column(
          children: [
            // customized header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Vapt',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      height: 1.0,
                    ),
                  ),
                  // Button that opens Drawer
                  Builder(
                    builder: (context) => IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon:
                          Icon(Icons.menu, color: Theme.of(context).colorScheme.onPrimary, size: 30),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ],
              ),
            ),

            // page content
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surfaceContainerHighest, // background that uses a very light tone from the primary color
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please insert a title';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      // Floating button (FAB)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Ensure any open drawers are closed before navigating
          Navigator.pushNamed(context, '/addReminder'); // Navigate to the AddReminder page
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary, size: 30),
      ),
    );
  }
}