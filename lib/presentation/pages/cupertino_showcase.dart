import 'package:flutter/cupertino.dart';

class CupertinoShowcasePage extends StatefulWidget {
  const CupertinoShowcasePage({super.key});

  @override
  State<CupertinoShowcasePage> createState() => _CupertinoShowcasePageState();
}

class _CupertinoShowcasePageState extends State<CupertinoShowcasePage> {
  bool _switchValue = false;
  double _sliderValue = 0.5;
  String _segmentValue = 'Day';
  final TextEditingController _textController = TextEditingController();
  bool _isLoading = false;
  int _currentTabIndex = 0;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _showAlertDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Alert Dialog'),
        content: const Text('This is a Cupertino alert dialog.'),
        actions: [
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Delete'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _showActionSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Action Sheet'),
        message: const Text('Choose an action'),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Option 1'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoActionSheetAction(
            child: const Text('Option 2'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Widget _buildShowcaseContent() {
    return SafeArea(
      child: ListView(
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
              CupertinoButton.filled(
                onPressed: () {},
                child: const Text('Filled Button'),
              ),
              CupertinoButton(
                onPressed: () {},
                child: const Text('Plain Button'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Text Field',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          CupertinoTextField(
            controller: _textController,
            placeholder: 'Enter text here',
            padding: const EdgeInsets.all(12),
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
              CupertinoSwitch(
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
          CupertinoSlider(
            value: _sliderValue,
            onChanged: (value) => setState(() => _sliderValue = value),
          ),
          const SizedBox(height: 24),

          const Text(
            'Segmented Control',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          CupertinoSegmentedControl<String>(
            children: const {
              'Day': Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Day'),
              ),
              'Week': Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Week'),
              ),
              'Month': Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Month'),
              ),
            },
            groupValue: _segmentValue,
            onValueChanged: (value) => setState(() => _segmentValue = value),
          ),
          const SizedBox(height: 24),

          const Text(
            'Activity Indicator',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              CupertinoActivityIndicator(radius: 12, animating: _isLoading),
              const SizedBox(width: 16),
              CupertinoButton(
                onPressed: () => setState(() => _isLoading = !_isLoading),
                child: Text(_isLoading ? 'Stop' : 'Start'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Dialogs & Action Sheets',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              CupertinoButton.filled(
                onPressed: _showAlertDialog,
                child: const Text('Show Alert Dialog'),
              ),
              CupertinoButton.filled(
                onPressed: _showActionSheet,
                child: const Text('Show Action Sheet'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          const Text(
            'Date Picker',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.systemGrey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (date) {},
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Picker',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.systemGrey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: CupertinoPicker(
              itemExtent: 32,
              onSelectedItemChanged: (index) {},
              children: const [
                Text('Option 1'),
                Text('Option 2'),
                Text('Option 3'),
                Text('Option 4'),
              ],
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Context Menu',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          CupertinoContextMenu(
            actions: [
              CupertinoContextMenuAction(
                child: const Text('Action 1'),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoContextMenuAction(
                child: const Text('Action 2'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CupertinoColors.systemBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Long press me',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSettingsTab() {
    return const SafeArea(
      child: Center(
        child: Text(
          'Settings Tab',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _currentTabIndex,
        onTap: (index) => setState(() => _currentTabIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => _buildShowcaseContent(),
              defaultTitle: 'Cupertino Showcase',
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => _buildSettingsTab(),
              defaultTitle: 'Settings',
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const Center(
                child: Text(
                  'Profile Tab',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              defaultTitle: 'Profile',
            );
          default:
            return CupertinoTabView(
              builder: (context) => _buildShowcaseContent(),
            );
        }
      },
    );
  }
}
