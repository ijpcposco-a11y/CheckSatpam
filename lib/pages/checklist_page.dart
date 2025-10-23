
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'export_page.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key});

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  List<Map<String, dynamic>> items = [
    {'task': 'Patroli Pagi', 'done': false},
    {'task': 'Patroli Malam', 'done': false},
    {'task': 'Cek CCTV', 'done': false},
    {'task': 'Cek Pintu & Jendela', 'done': false},
  ];

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pop(context);
  }

  void _export() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ExportPage(items: items)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist Satpam'),
        actions: [
          IconButton(onPressed: _export, icon: const Icon(Icons.download)),
          IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          return CheckboxListTile(
            title: Text(items[index]['task']),
            value: items[index]['done'],
            onChanged: (val) {
              setState(() {
                items[index]['done'] = val!;
              });
            },
          );
        },
      ),
    );
  }
}
