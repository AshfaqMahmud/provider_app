import 'package:flutter/material.dart';

class SafeAreaExamplePage extends StatefulWidget {
  const SafeAreaExamplePage({super.key});

  @override
  State<SafeAreaExamplePage> createState() => _SafeAreaExamplePageState();
}

class _SafeAreaExamplePageState extends State<SafeAreaExamplePage> {
  bool _useSafeArea = true;
  bool _showStatusBar = true;

  DeviceType _getDeviceType(double width, double height, double pixelRatio) {
    if (width >= 600 || height >= 600) return DeviceType.tablet;
    if (width >= 400 && height >= 400) return DeviceType.foldable;
    return DeviceType.phone;
  }

  ScreenResolution _getResolution(double pixelRatio) {
    if (pixelRatio >= 3.0) return ScreenResolution.highRes;
    if (pixelRatio >= 2.0) return ScreenResolution.mediumRes;
    return ScreenResolution.lowRes;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final devicePixelRatio = mediaQuery.devicePixelRatio;
    final orientation = mediaQuery.orientation;

    final deviceType = _getDeviceType(size.width, size.height, devicePixelRatio);
    final resolution = _getResolution(devicePixelRatio);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaQuery & SafeArea Test'),
        actions: [
          IconButton(
            icon: Icon(_useSafeArea ? Icons.check_box : Icons.check_box_outline_blank),
            onPressed: () => setState(() => _useSafeArea = !_useSafeArea),
            tooltip: 'Toggle SafeArea',
          ),
        ],
      ),
      body: _useSafeArea
          ? SafeArea(
              top: _showStatusBar,
              bottom: true,
              left: true,
              right: true,
              child: _buildContent(context, mediaQuery, deviceType, resolution, orientation),
            )
          : _buildContent(context, mediaQuery, deviceType, resolution, orientation),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'safearea',
            onPressed: () => setState(() => _useSafeArea = !_useSafeArea),
            child: Icon(_useSafeArea ? Icons.no_encryption : Icons.enhanced_encryption),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'statusbar',
            onPressed: () => setState(() => _showStatusBar = !_showStatusBar),
            child: Icon(_showStatusBar ? Icons.fullscreen : Icons.fullscreen_exit),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    MediaQueryData mediaQuery,
    DeviceType deviceType,
    ScreenResolution resolution,
    Orientation orientation,
  ) {
    final size = mediaQuery.size;
    final padding = mediaQuery.padding;
    final viewInsets = mediaQuery.viewInsets;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildInfoCard('Device Info', [
              _infoRow('Device Type', _deviceTypeString(deviceType)),
              _infoRow('Resolution', _resolutionString(resolution)),
              _infoRow('Orientation', orientation.toString().split('.').last),
              _infoRow('Pixel Ratio', '${mediaQuery.devicePixelRatio.toStringAsFixed(2)}x'),
              _infoRow('Screen Size', '${size.width.toStringAsFixed(1)} x ${size.height.toStringAsFixed(1)}'),
              _infoRow('Physical Size', '${(size.width * mediaQuery.devicePixelRatio).toStringAsFixed(0)} x ${(size.height * mediaQuery.devicePixelRatio).toStringAsFixed(0)} px'),
            ]),
            const SizedBox(height: 10),
            _buildInfoCard('SafeArea / Padding', [
              _infoRow('Top Padding', padding.top.toStringAsFixed(1)),
              _infoRow('Bottom Padding', padding.bottom.toStringAsFixed(1)),
              _infoRow('Left Padding', padding.left.toStringAsFixed(1)),
              _infoRow('Right Padding', padding.right.toStringAsFixed(1)),
              _infoRow('View Insets', viewInsets.toString()),
            ]),
            const SizedBox(height: 10),
            _buildResponsiveCard(deviceType, orientation),
            const SizedBox(height: 10),
            _buildColorGrid(),
            const SizedBox(height: 10),
            _buildButtonGrid(),
            const SizedBox(height: 10),
            _buildTextExamples(),
            const SizedBox(height: 10),
            _buildProgressBar(),
            const SizedBox(height: 10),
            _buildIconRow(),
            const SizedBox(height: 10),
            _buildSliderExample(),
            const SizedBox(height: 10),
            _buildSwitchAndCheckbox(),
            const SizedBox(height: 10),
            _buildListTiles(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildResponsiveCard(DeviceType deviceType, Orientation orientation) {
    final isTablet = deviceType == DeviceType.tablet;
    final isFoldable = deviceType == DeviceType.foldable;

    return Card(
      elevation: 4,
      color: isTablet ? Colors.green.shade100 : (isFoldable ? Colors.orange.shade100 : Colors.blue.shade100),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Responsive Layout Example',
              style: TextStyle(fontSize: isTablet ? 24 : 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Device: ${_deviceTypeString(deviceType)}',
                style: TextStyle(fontSize: isTablet ? 20 : 16)),
            Text('Orientation: ${orientation.toString().split('.').last}',
                style: TextStyle(fontSize: isTablet ? 20 : 16)),
            const SizedBox(height: 10),
            orientation == Orientation.landscape
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildResponsiveItems(4),
                  )
                : Column(
                    children: _buildResponsiveItems(isTablet ? 3 : 2),
                  ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildResponsiveItems(int count) {
    final colors = [Colors.red, Colors.green, Colors.blue, Colors.orange];
    return List.generate(count, (i) => Container(
      margin: const EdgeInsets.all(4),
      width: 60,
      height: 60,
      color: colors[i % colors.length],
      child: Center(
        child: Text('${i + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    ));
  }

  Widget _buildColorGrid() {
    final colors = [
      Colors.red, Colors.green, Colors.blue, Colors.yellow,
      Colors.orange, Colors.purple, Colors.teal, Colors.pink,
      Colors.cyan, Colors.indigo, Colors.lime, Colors.amber,
    ];
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Color Grid Test', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.5,
              children: colors.map((color) => Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                     color.toString().split('(')[0].split('.').last,
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonGrid() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Button Examples', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
                TextButton(onPressed: () {}, child: const Text('Text')),
                OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
                FloatingActionButton.small(onPressed: () {}, child: const Icon(Icons.add)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.star)),
                ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.save), label: const Text('Save')),
                OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.cancel), label: const Text('Cancel')),
                TextButton.icon(onPressed: () {}, icon: const Icon(Icons.info), label: const Text('Info')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextExamples() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Text Examples', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Headline Large', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const Text('Headline Medium', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
            const Text('Body Large', style: TextStyle(fontSize: 18)),
            const Text('Body Medium', style: TextStyle(fontSize: 16)),
            const Text('Body Small', style: TextStyle(fontSize: 14, color: Colors.grey)),
            const Text('Caption', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
            const SizedBox(height: 10),
            RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: 'Rich ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                  TextSpan(text: 'Text ', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.blue)),
                  TextSpan(text: 'Example', style: TextStyle(decoration: TextDecoration.underline, color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Progress Indicators', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const LinearProgressIndicator(value: 0.7),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CircularProgressIndicator(value: 0.3),
                CircularProgressIndicator(value: 0.6),
                CircularProgressIndicator(value: 0.9),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconRow() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Icon Examples', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                Icon(Icons.home, size: 32, color: Colors.blue),
                Icon(Icons.settings, size: 32, color: Colors.grey),
                Icon(Icons.favorite, size: 32, color: Colors.red),
                Icon(Icons.star, size: 32, color: Colors.amber),
                Icon(Icons.email, size: 32, color: Colors.green),
                Icon(Icons.phone, size: 32, color: Colors.purple),
                Icon(Icons.camera, size: 32, color: Colors.orange),
                Icon(Icons.music_note, size: 32, color: Colors.pink),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderExample() {
    double sliderValue = 0.5;
    return StatefulBuilder(
      builder: (context, setState) => Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Slider & RangeSlider', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Slider(
                value: sliderValue,
                onChanged: (v) => setState(() => sliderValue = v),
              ),
              Text('Value: ${(sliderValue * 100).toStringAsFixed(0)}%'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchAndCheckbox() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Switches & Checkboxes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: const [
                      Switch(value: true, onChanged: null),
                      Text('Switch On'),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      Switch(value: false, onChanged: null),
                      Text('Switch Off'),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      Checkbox(value: true, onChanged: null),
                      Text('Checked'),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      Checkbox(value: false, onChanged: null),
                      Text('Unchecked'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTiles() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('List Tiles', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('John Doe'),
              subtitle: Text('Software Engineer'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('jane@example.com'),
              subtitle: Text('Email'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('+1 234 567 890'),
              subtitle: Text('Phone'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  String _deviceTypeString(DeviceType type) {
    switch (type) {
      case DeviceType.tablet:
        return 'Tablet';
      case DeviceType.foldable:
        return 'Foldable / Flippable';
      case DeviceType.phone:
        return 'Phone';
    }
  }

  String _resolutionString(ScreenResolution res) {
    switch (res) {
      case ScreenResolution.highRes:
        return 'High Resolution (3x+)';
      case ScreenResolution.mediumRes:
        return 'Medium Resolution (2x)';
      case ScreenResolution.lowRes:
        return 'Low Resolution (1x)';
    }
  }
}

enum DeviceType { phone, tablet, foldable }
enum ScreenResolution { lowRes, mediumRes, highRes }
