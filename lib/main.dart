import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/note_database.dart';
import 'package:flutter_tutorial/page/note_page.dart';
import 'package:flutter_tutorial/them/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        // Note provider
        ChangeNotifierProvider(create: (context) => NoteDatabase()),

        //theme provider
        ChangeNotifierProvider(create: (context) => ThemProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Notespage(),
      theme: Provider.of<ThemProvider>(context).themeData,
    );
  }
}
