import 'package:flutter/material.dart';

class FlexExpandedDemoPage extends StatefulWidget {
  const FlexExpandedDemoPage({super.key});

  @override
  State<FlexExpandedDemoPage> createState() => _FlexExpandedDemoPageState();
}

class _FlexExpandedDemoPageState extends State<FlexExpandedDemoPage> {
  int _flex1 = 1;
  int _flex2 = 1;
  int _flex3 = 1;
  bool _useRow = true;
  bool _useExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex & Expanded Demo'),
        actions: [
          IconButton(
            icon: Icon(_useRow ? Icons.horizontal_split : Icons.vertical_split),
            onPressed: () => setState(() => _useRow = !_useRow),
            tooltip: _useRow ? 'Switch to Column' : 'Switch to Row',
          ),
          IconButton(
            icon: Icon(_useExpanded ? Icons.expand : Icons.compress),
            onPressed: () => setState(() => _useExpanded = !_useExpanded),
            tooltip: _useExpanded ? 'Use Flexible' : 'Use Expanded',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildInfoCard(),
            const SizedBox(height: 16),
            _buildControls(),
            const SizedBox(height: 16),
            _buildFlexDemo(),
            const SizedBox(height: 16),
            _buildCodeExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Flex & Expanded Widgets',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'Expanded is a shorthand for Flexible with fit: FlexFit.tight. '
              'The flex property determines how much space a child should occupy relative to its siblings.',
            ),
            const SizedBox(height: 8),
            Text('Direction: ${_useRow ? "Row (Horizontal)" : "Column (Vertical)"}'),
            Text('Widget: ${_useExpanded ? "Expanded" : "Flexible"}'),
          ],
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Flex Values',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildSlider('Container 1 (Red)', _flex1, (v) => setState(() => _flex1 = v)),
            const SizedBox(height: 8),
            _buildSlider('Container 2 (Green)', _flex2, (v) => setState(() => _flex2 = v)),
            const SizedBox(height: 8),
            _buildSlider('Container 3 (Blue)', _flex3, (v) => setState(() => _flex3 = v)),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(String label, int value, Function(int) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: $value'),
        Slider(
          value: value.toDouble(),
          min: 0,
          max: 5,
          divisions: 5,
          label: value.toString(),
          onChanged: (v) => onChanged(v.round()),
        ),
      ],
    );
  }

  Widget _buildFlexDemo() {
    final children = [
      _buildFlexibleBox(Colors.red, _flex1, 'Flex: $_flex1'),
      _buildFlexibleBox(Colors.green, _flex2, 'Flex: $_flex2'),
      _buildFlexibleBox(Colors.blue, _flex3, 'Flex: $_flex3'),
    ];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_useExpanded ? "Expanded" : "Flexible"} in ${_useRow ? "Row" : "Column"}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              height: _useRow ? 150 : null,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: _useRow
                  ? Row(children: children)
                  : Column(children: children),
            ),
            const SizedBox(height: 8),
            const Text(
              'Note: Flex value of 0 means the child is inflexible (won\'t expand).',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlexibleBox(Color color, int flex, String label) {
    final child = Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.7),
        border: Border.all(color: color, width: 2),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(color: Colors.black, blurRadius: 2)],
          ),
        ),
      ),
    );

    if (_useExpanded) {
      return Expanded(flex: flex, child: child);
    } else {
      return Flexible(flex: flex, fit: FlexFit.tight, child: child);
    }
  }

  Widget _buildCodeExample() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Code Example',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _useRow
                    ? 'Row(\n'
                        '  children: [\n'
                        '    Expanded(flex: $_flex1, child: Container(color: Colors.red)),\n'
                        '    Expanded(flex: $_flex2, child: Container(color: Colors.green)),\n'
                        '    Expanded(flex: $_flex3, child: Container(color: Colors.blue)),\n'
                        '  ],\n'
                        ')'
                    : 'Column(\n'
                        '  children: [\n'
                        '    Expanded(flex: $_flex1, child: Container(color: Colors.red)),\n'
                        '    Expanded(flex: $_flex2, child: Container(color: Colors.green)),\n'
                        '    Expanded(flex: $_flex3, child: Container(color: Colors.blue)),\n'
                        '  ],\n'
                        ')',
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
