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
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: Consumer<CounterModel>(
          builder: (context, counterModel, child) {
            return Text(
              'The value of counter is: ${counterModel.counter}',
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: () {
          // increment counter
          context.read<CounterModel>().incrementCounter();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
