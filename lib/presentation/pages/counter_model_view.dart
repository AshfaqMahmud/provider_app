import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/data/models/counter_model.dart';

class CounterModelView extends StatefulWidget {
  const CounterModelView({super.key});

  @override
  State<CounterModelView> createState() => _CounterModelViewState();
}

class _CounterModelViewState extends State<CounterModelView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.safety_check),
            onPressed: () => Navigator.pushNamed(context, '/safearea'),
            tooltip: 'MediaQuery & SafeArea Test',
          ),
          IconButton(
            icon: const Icon(Icons.view_column),
            onPressed: () => Navigator.pushNamed(context, '/flex'),
            tooltip: 'Flex & Expanded Demo',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterModel>(
              builder: (context, counterModel, child) {
                return Text(
                  'The value of counter is: ${counterModel.counter}',
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/safearea'),
              icon: const Icon(Icons.open_in_new),
              label: const Text('Test MediaQuery & SafeArea'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/flex'),
              icon: const Icon(Icons.view_column),
              label: const Text('Test Flex & Expanded'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/cupertino'),
              icon: const Icon(Icons.phone_iphone),
              label: const Text('Cupertino Showcase'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/material'),
              icon: const Icon(Icons.android),
              label: const Text('Material Showcase'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/comparison'),
              icon: const Icon(Icons.compare),
              label: const Text('Style Comparison'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: () {
          context.read<CounterModel>().incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
