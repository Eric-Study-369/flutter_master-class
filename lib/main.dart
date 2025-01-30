import 'package:flutter/material.dart';
import 'package:flutter_tutorial/database/habit_database.dart';
import 'package:flutter_tutorial/page/home_page.dart';
import 'package:flutter_tutorial/theme/them_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialialize database
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchDate();
  runApp(
    MultiProvider(
      providers: [
        // habit provider
        ChangeNotifierProvider(create: (context) => HabitDatabase()),

        // theme provider
        ChangeNotifierProvider(create: (context) => ThemProvider()),
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
      home: HomePage(),
      theme: Provider.of<ThemProvider>(context).themeData,
    );
  }
}
