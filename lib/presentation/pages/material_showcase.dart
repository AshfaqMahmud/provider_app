import 'package:flutter/material.dart';

class MaterialShowcasePage extends StatefulWidget {
  const MaterialShowcasePage({super.key});

  @override
  State<MaterialShowcasePage> createState() => _MaterialShowcasePageState();
}

class _MaterialShowcasePageState extends State<MaterialShowcasePage> {
  bool _switchValue = false;
  double _sliderValue = 0.5;
  String _dropdownValue = 'Option 1';
  bool _checkboxValue = false;
  String? _radioValue = 'A';
  final TextEditingController _textController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert Dialog'),
        content: const Text('This is a Material alert dialog.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text('Bottom Sheet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(leading: const Icon(Icons.share), title: const Text('Share'), onTap: () {}),
            ListTile(leading: const Icon(Icons.copy), title: const Text('Copy'), onTap: () {}),
            ListTile(leading: const Icon(Icons.delete), title: const Text('Delete'), onTap: () {}),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Showcase'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Buttons',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated Button'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Text Button'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined Button'),
              ),
              FloatingActionButton.small(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Text Field',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter text here',
              hintText: 'Type something',
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Switch',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Enable feature'),
              Switch(
                value: _switchValue,
                onChanged: (value) => setState(() => _switchValue = value),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Slider',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Slider(
            value: _sliderValue,
            onChanged: (value) => setState(() => _sliderValue = value),
          ),
          const SizedBox(height: 24),

          const Text(
            'Checkbox & Radio',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Checkbox(
                value: _checkboxValue,
                onChanged: (value) => setState(() => _checkboxValue = value!),
              ),
              const Text('Checkbox'),
              const SizedBox(width: 24),
              Radio<String>(
                value: 'A',
                groupValue: _radioValue,
                onChanged: (value) => setState(() => _radioValue = value),
              ),
              const Text('A'),
              Radio<String>(
                value: 'B',
                groupValue: _radioValue,
                onChanged: (value) => setState(() => _radioValue = value),
              ),
              const Text('B'),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Dropdown',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButton<String>(
            value: _dropdownValue,
            isExpanded: true,
            items: const [
              DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
              DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
              DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
            ],
            onChanged: (value) => setState(() => _dropdownValue = value!),
          ),
          const SizedBox(height: 24),

          const Text(
            'Linear Progress Indicator',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _isLoading
                    ? const LinearProgressIndicator()
                    : const LinearProgressIndicator(value: 0.6),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () => setState(() => _isLoading = !_isLoading),
                icon: Icon(_isLoading ? Icons.stop : Icons.play_arrow),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Circular Progress Indicator',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _isLoading
                  ? const CircularProgressIndicator()
                  : const CircularProgressIndicator(value: 0.6),
              const SizedBox(width: 24),
              IconButton(
                onPressed: () => setState(() => _isLoading = !_isLoading),
                icon: Icon(_isLoading ? Icons.stop : Icons.play_arrow),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Dialogs & Bottom Sheet',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: _showAlertDialog,
                child: const Text('Show Alert Dialog'),
              ),
              ElevatedButton(
                onPressed: _showBottomSheet,
                child: const Text('Show Bottom Sheet'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Card',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Card Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('This is a Material card with some content inside.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Chip',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              Chip(label: const Text('Chip 1'), avatar: const Icon(Icons.star, size: 16)),
              Chip(label: const Text('Chip 2'), deleteIcon: const Icon(Icons.close, size: 16), onDeleted: () {}),
              const InputChip(label: Text('Input Chip')),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Bottom Navigation Bar',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ],
              currentIndex: 0,
              onTap: (_) {},
              type: BottomNavigationBarType.fixed,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
