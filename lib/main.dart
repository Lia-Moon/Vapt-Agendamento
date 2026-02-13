// import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:vapt_agendamento/core/app_colors.dart';
import 'package:vapt_agendamento/modules/home/home_page.dart';
//import 'package:vapt_agendamento/core/app_theme.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return MaterialApp(
//       title: 'Vapt App',
//       debugShowCheckedModeBanner: false, // Remove a faixa de "Debug" no canto da tela
//       theme: ThemeData(useMaterial3: true, colorScheme: AppColors.lightColorScheme),
//       darkTheme: ThemeData(useMaterial3: true, colorScheme: AppColors.darkColorScheme),
//       themeMode: ThemeMode.system, // Switches based on system settings
//       home: const HomePage(), // Aqui você define qual tela abre primeiro
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

final ValueNotifier<String> selectedTheme = ValueNotifier('purple');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // The ValueListenableBuilder rebuilds the MaterialApp whenever the selectedTheme changes
    return ValueListenableBuilder<String>(
      valueListenable: selectedTheme,
      builder: (context, currentTheme, child) {
        return MaterialApp(
          title: 'Vapt App',
          debugShowCheckedModeBanner: false,
          
          // search the color scheme dynamaically
          theme: ThemeData(
            colorScheme: AppColors.getColorScheme(false, currentTheme),
            useMaterial3: true,
          ),
          
          // also set the darktheme
          darkTheme: ThemeData(
            colorScheme: AppColors.getColorScheme(true, currentTheme),
            useMaterial3: true,
          ),

          // configuration from user system (light/dark)
          themeMode: ThemeMode.system, 
          
          home: const HomePage(),
        );
      },
    );
  }
}
