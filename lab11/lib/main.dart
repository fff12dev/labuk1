import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/container_config_provider.dart';
import 'widgets/sliders_section.dart';
import 'widgets/red_container_preview.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ContainerConfigProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Container Configurator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ConfiguratorHomeScreen(),
    );
  }
}

class ConfiguratorHomeScreen extends StatelessWidget {
  const ConfiguratorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Кастомний віджет із секцією слайдерів
            SlidersSection(),
            SizedBox(height: 16),
            // Кастомний віджет із червоним контейнером
            Expanded(
              child: RedContainerPreview(),
            ),
          ],
        ),
      ),
    );
  }
}
