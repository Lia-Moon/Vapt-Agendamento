import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vapt_agendamento/core/app_colors.dart';
import 'package:vapt_agendamento/core/theme_provider.dart';
import 'package:vapt_agendamento/modules/home/home_page.dart';
import 'package:vapt_agendamento/modules/settings/settings_page.dart';

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
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: AppColors.getColorScheme(false, themeProvider.selectedColor),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: AppColors.getColorScheme(true, themeProvider.selectedColor),
          ),
          themeMode: ThemeMode.system,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/settings': (context) => const SettingsPage(),
          }
        );
      },
    );
  }
}