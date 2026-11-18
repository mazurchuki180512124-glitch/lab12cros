
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/corner_provider.dart';
import 'widgets/corner_sliders.dart';
import 'widgets/blue_container_preview.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CornerProvider(),
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
      title: 'Lab 12 - Provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Конфігуратор кутів'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Налаштування заокруглення',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              const CornerSliders(),

              const SizedBox(height: 25),

              const Text(
                'Попередній перегляд',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),

              const BlueContainerPreview(),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () {
                  context.read<CornerProvider>().reset();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Скинути налаштування'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
