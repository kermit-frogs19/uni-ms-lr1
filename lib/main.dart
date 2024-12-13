import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seliukov_vadim_kiuki_21_9/widgets/tabs_screen.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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