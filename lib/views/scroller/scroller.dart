import 'package:flutter/material.dart';

class ScrollerView extends StatefulWidget {
  const ScrollerView({super.key});

  @override
  State<ScrollerView> createState() => _ScrollerViewState();
}

class _ScrollerViewState extends State<ScrollerView> {
  final List<int> shades = [100, 200, 300, 400, 500, 600, 700, 800, 900];
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing de Scrolls'),
      ),
      body: SizedBox(
        height: 1000,
        width: 1000,
        child: Scrollbar(
          controller: _vertical,
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 10,
          child: Scrollbar(
            controller: _horizontal,
            thumbVisibility: true,
            trackVisibility: true,
            thickness: 10,
            notificationPredicate: (notif) => notif.depth == 1,
            child: SingleChildScrollView(
              controller: _vertical,
              child: SingleChildScrollView(
                controller: _horizontal,
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Vista previa')),
                    DataColumn(label: Text('Color')),
                    DataColumn(label: Text('Sombra')),
                    DataColumn(label: Text('Filler')),
                    DataColumn(label: Text('Filler')),
                    DataColumn(label: Text('Filler')),
                    DataColumn(label: Text('Filler')),
                    DataColumn(label: Text('Filler')),
                    DataColumn(label: Text('Filler')),
                    DataColumn(label: Text('Filler')),
                    DataColumn(label: Text('Filler')),
                  ],
                  rows: [
                    for (var color in Colors.primaries)
                      for (var shade in shades)
                        DataRow(
                          cells: [
                            DataCell(Container(
                                height: 20, width: 50, color: color[shade])),
                            DataCell(Text(color.toString())),
                            DataCell(Text('$shade')),
                            DataCell(Text('1')),
                            DataCell(Text('1')),
                            DataCell(Text('1')),
                            DataCell(Text('1')),
                            DataCell(Text('1')),
                            DataCell(Text('1')),
                            DataCell(Text('1')),
                            DataCell(Text('1')),
                          ],
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
