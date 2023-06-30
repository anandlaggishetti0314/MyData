import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:insurenceproject/claimsData.dart';
import 'package:http/http.dart' as http;

class TableData extends StatefulWidget {
  const TableData({super.key});

  @override
  State<TableData> createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  List<ClaimsData> _data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final response = await http.get(
      Uri.parse("http://localhost:8025/securisk/viewAll"),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final List<dynamic> decodedData = jsonDecode(response.body);
      print(decodedData);
      setState(() {
        _data = decodedData.map((e) => ClaimsData.fromJson(e)).toList();
      });
    } else {
      print("Data is not found");

      // Handle error or show an error message to the user
    }
  }

  Future<void> editClaimsData(ClaimsData updatedData) async {
    final response = await http.put(
      Uri.parse("http://localhost:8025/securisk/editData"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedData.toJson()),
    );

    if (response.statusCode == 200) {
      getData();
    }
  }

  // void deleteItem(int index) {
  //   int index1 = ClaimsData.indexWhere((tpa) => tpa.sno == index);
  //   http.delete(
  //     Uri.parse("http://localhost:8888/Tpadelete/${index1}"),
  //     headers: {'Content-Type': 'application/json'},
  //   ).then((response) {
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         ClaimsData.removeAt(index1);
  //       });
  //     } else {
  //       print('Failed to delete item. Error: ${response.body}');
  //     }
  //   }).catchError((error) {
  //     print('Error deleting item: $error');
  //   });
  // }

  get editwidget => null;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return Container(
      width: screenWidth * 0.90,
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          child: DataTable(
            columnSpacing: 10.0,
            columns: const [
              DataColumn(label: Text('S.No')),
              DataColumn(label: Text('Key')),
              DataColumn(label: Text('Excel Value')),
              DataColumn(label: Text('Type')),
              DataColumn(label: Text('TPA')),
              DataColumn(label: Text('Action')),
            ],
            rows: _data
                .map(
                  (item) => DataRow(
                    cells: [
                      DataCell(Text(item.sno.toString())),
                      DataCell(Text(item.key.toString())),
                      DataCell(Text(item.excelValue.toString())),
                      DataCell(Text(item.type.toString())),
                      DataCell(Text(item.tpa.toString())),
                      DataCell(Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              editClaimsData(item);
                            },
                            icon: Icon(Icons.edit, color: Colors.black),
                          ),
                          IconButton(
                            onPressed: editwidget,
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      )),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
