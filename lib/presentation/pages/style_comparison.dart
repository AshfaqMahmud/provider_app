import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyleComparisonPage extends StatefulWidget {
  const StyleComparisonPage({super.key});

  @override
  State<StyleComparisonPage> createState() => _StyleComparisonPageState();
}

class _StyleComparisonPageState extends State<StyleComparisonPage> {
  bool _materialSwitch = false;
  bool _cupertinoSwitch = false;
  double _materialSlider = 0.5;
  double _cupertinoSlider = 0.5;
  // Removed unused fields

  void _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Material Dialog'),
        content: const Text('This is a Material Design dialog.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showCupertinoDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Cupertino Dialog'),
        content: const Text('This is a Cupertino (iOS) dialog.'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Style Comparison'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Design Philosophy',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Material Design', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
                  SizedBox(height: 4),
                  Text('• Google\'s design language for Android, Web, and cross-platform'),
                  Text('• Emphasizes bold colors, depth, and motion'),
                  Text('• Uses elevation (shadows) to create hierarchy'),
                  Text('• More customizable and flexible'),
                  SizedBox(height: 12),
                  Text('Cupertino', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CupertinoColors.activeBlue)),
                  SizedBox(height: 4),
                  Text('• Apple\'s design language for iOS'),
                  Text('• Follows Human Interface Guidelines'),
                  Text('• Uses translucency and blur effects'),
                  Text('• Prioritizes native iOS look and feel'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Buttons Comparison',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Material', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
                    const SizedBox(height: 8),
                    ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
                    const SizedBox(height: 8),
                    TextButton(onPressed: () {}, child: const Text('Text')),
                    const SizedBox(height: 8),
                    OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Cupertino', style: TextStyle(fontWeight: FontWeight.w600, color: CupertinoColors.activeBlue)),
                    const SizedBox(height: 8),
                    CupertinoButton.filled(onPressed: () {}, child: const Text('Filled')),
                    const SizedBox(height: 8),
                    CupertinoButton(onPressed: () {}, child: const Text('Plain')),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Switches Comparison',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Material', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
                    const SizedBox(height: 8),
                    Switch(
                      value: _materialSwitch,
                      onChanged: (v) => setState(() => _materialSwitch = v),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Cupertino', style: TextStyle(fontWeight: FontWeight.w600, color: CupertinoColors.activeBlue)),
                    const SizedBox(height: 8),
                    CupertinoSwitch(
                      value: _cupertinoSwitch,
                      onChanged: (v) => setState(() => _cupertinoSwitch = v),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Sliders Comparison',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Material', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
                    const SizedBox(height: 8),
                    Slider(
                      value: _materialSlider,
                      onChanged: (v) => setState(() => _materialSlider = v),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Cupertino', style: TextStyle(fontWeight: FontWeight.w600, color: CupertinoColors.activeBlue)),
                    const SizedBox(height: 8),
                    CupertinoSlider(
                      value: _cupertinoSlider,
                      onChanged: (v) => setState(() => _cupertinoSlider = v),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Dialogs Comparison',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Material', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _showMaterialDialog,
                      child: const Text('Show Dialog'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Cupertino', style: TextStyle(fontWeight: FontWeight.w600, color: CupertinoColors.activeBlue)),
                    const SizedBox(height: 8),
                    CupertinoButton.filled(
                      onPressed: _showCupertinoDialog,
                      child: const Text('Show Dialog'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Text Fields Comparison',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Material', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
                    const SizedBox(height: 8),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Material Field',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Cupertino', style: TextStyle(fontWeight: FontWeight.w600, color: CupertinoColors.activeBlue)),
                    const SizedBox(height: 8),
                    const CupertinoTextField(
                      placeholder: 'Cupertino Field',
                      padding: EdgeInsets.all(12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Progress Indicators Comparison',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Material', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
                    SizedBox(height: 8),
                    LinearProgressIndicator(),
                    SizedBox(height: 8),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Cupertino', style: TextStyle(fontWeight: FontWeight.w600, color: CupertinoColors.activeBlue)),
                    SizedBox(height: 8),
                    CupertinoActivityIndicator(radius: 10),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'When to Use',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Use Material when:', style: TextStyle(fontWeight: FontWeight.w600)),
                  Text('• Building for Android-first apps'),
                  Text('• Need more customization options'),
                  Text('• Want consistent look across platforms'),
                  SizedBox(height: 12),
                  Text('Use Cupertino when:', style: TextStyle(fontWeight: FontWeight.w600)),
                  Text('• Building for iOS-first apps'),
                  Text('• Need native iOS look and feel'),
                  Text('• Want to follow Apple HIG strictly'),
                  SizedBox(height: 12),
                  Text('Use Both when:', style: TextStyle(fontWeight: FontWeight.w600)),
                  Text('• Building cross-platform with platform-specific UI'),
                  Text('• Use Theme.of(context).platform to switch'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
