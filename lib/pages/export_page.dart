
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class ExportPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const ExportPage({super.key, required this.items});

  Future<void> _exportToExcel(BuildContext context) async {
    var excel = Excel.createExcel();
    Sheet sheet = excel['Checklist'];

    sheet.appendRow(['No', 'Task', 'Done']);
    for (int i = 0; i < items.length; i++) {
      sheet.appendRow([i + 1, items[i]['task'], items[i]['done'] ? 'Yes' : 'No']);
    }

    Directory dir = await getApplicationDocumentsDirectory();
    String fileName = 'Checklist_${DateFormat('yyyyMMdd_HHmm').format(DateTime.now())}.xlsx';
    File file = File('${dir.path}/$fileName');
    await file.writeAsBytes(excel.encode()!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Export selesai: ${file.path}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Export Checklist')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _exportToExcel(context),
          child: const Text('Export ke Excel'),
        ),
      ),
    );
  }
}
