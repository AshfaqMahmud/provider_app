import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/data/models/counter_model.dart';
import 'package:provider_app/presentation/pages/counter_model_view.dart';
import 'package:provider_app/presentation/pages/safe_area.dart';
import 'package:provider_app/presentation/pages/flex_expanded_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: '/',
      routes: {
        '/': (context) => ChangeNotifierProvider<CounterModel>(
              create: (_) => CounterModel(0),
              child: const CounterModelView(),
            ),
        '/safearea': (context) => const SafeAreaExamplePage(),
        '/flex': (context) => const FlexExpandedDemoPage(),
      },
    );
  }
}
