import 'package:flutter/material.dart';
import 'widgets/webview_page.dart'; // Import the separated widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false ,
      title: 'bootig',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WebViewPage(), // Use the imported widget
    );
  }
}

