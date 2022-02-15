import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
            ),
          ),
          title: const Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              Expanded(child: buildMenu())
            ],
          ),
        ));
  }

  Widget buildMenu() {
    return ListView(
      children: [
        buildDarkModeRow('Dark Mode'),
        buildDarkModeRow('Disable break'),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Version'),
              Text('0.0.1'),
            ],
          ),
        )
      ],
    );
  }

  Widget buildDarkModeRow(String word) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
              value: false,
              onChanged: (value) {
                value = true;
              })
        ],
      ),
    );
  }
}
