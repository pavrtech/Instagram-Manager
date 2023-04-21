import 'package:flutter/material.dart';
import 'package:reeldownloader/screen/HomePage.dart';

import 'UI/download_page.dart';
import 'UI/profile_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(backgroundColor: Colors.transparent)),
    );
  }
}
