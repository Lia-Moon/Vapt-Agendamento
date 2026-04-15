import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vapt_agendamento/core/theme_provider.dart';
import 'package:vapt_agendamento/core/app_theme.dart';
import 'package:vapt_agendamento/modules/home/home_page.dart';
import 'package:vapt_agendamento/modules/reminder/add_reminder.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Vapt App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.createTheme(false, themeProvider.selectedColor),
          darkTheme: AppTheme.createTheme(true, themeProvider.selectedColor),
          themeMode: ThemeMode.system,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/home': (context) => const HomePage(),
            '/addReminder': (context) => const AddReminder(),
          }
        );
      },
    );
  }
}