import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/tabs_screen.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Students App',
      theme: ThemeData(primarySwatch: Colors.blue, textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),),
      home: const TabsScreen(),
    );
  }
}