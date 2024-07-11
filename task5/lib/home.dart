import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _DBbox = Hive.box('DBbox');
  @override
  Widget build(BuildContext context) {
    var keys = _DBbox.keys.toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Data stored using Hive"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/login');
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Name',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              DataColumn(
                label: Text('Email', style: TextStyle(fontSize: 18)),
              ),
              DataColumn(
                label: Text('Password', style: TextStyle(fontSize: 18)),
              ),
            ],
            rows: List<DataRow>.generate(
              keys.length,
              (index) {
                var key = keys[index];
                var user = _DBbox.get(key);
                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text(user[0], style: TextStyle(fontSize: 18))),
                    DataCell(Text(user[1], style: TextStyle(fontSize: 18))),
                    DataCell(Text(user[2], style: TextStyle(fontSize: 18))),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
