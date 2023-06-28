import 'package:deals_task/createdeals.dart';
import 'package:flutter/material.dart';

class dealTable extends StatefulWidget {
  @override
  _dealTableState createState() => _dealTableState();
}

class _dealTableState extends State<dealTable> {
  List<Map<String, String>> deal = [
    {
      'S no': '01',
      'Deal Name': 'deal',
      'Deal Owner': 'test',
      'Amount': '400000',
      'Account Name': 'Name',
      'Lead Source': 'source',
      'Expected Revenue': '500000'
    },
    {
      'S no': '01',
      'Deal Name': 'deal',
      'Deal Owner': 'test',
      'Amount': '400000',
      'Account Name': 'Name',
      'Lead Source': 'source',
      'Expected Revenue': '500000'
    }
  ];

  @override
  Widget build(BuildContext context) {
    var _chosenType;
    return Scaffold(
        appBar: AppBar(
          title: Text('Deal List'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      margin: EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search,
                              color: Color.fromARGB(255, 238, 169, 191)),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          print('Input: $value');
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 60,
                      margin: EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: _chosenType,
                        elevation: 5,
                        items: <String>[
                          'Processing',
                          'Pending',
                          'Submitted',
                          'Closed',
                          'Lost'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                        hint: const Text("Filter by"),
                        onChanged: (String? value) {
                          setState(() {
                            _chosenType = value;
                            if (_chosenType != 'Filter by') {
                              List data = ItemInformation() as List;
                              data
                                  .where((element) =>
                                      element.type.contains(_chosenType))
                                  .toList();
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CrudPage(),
                        ),
                      );
                    },
                    child: Text('Create Deal'),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('S no')),
                      DataColumn(label: Text('Deal Name')),
                      DataColumn(label: Text('Deal Owner')),
                      DataColumn(label: Text('Amount')),
                      DataColumn(label: Text('Account Name')),
                      DataColumn(label: Text('Lead Source')),
                      DataColumn(label: Text('Expected Revenue')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: deal.map((s) {
                      return DataRow(
                        cells: [
                          DataCell(Text(s['S no'] ?? '')),
                          DataCell(Text(s['Deal Name'] ?? '')),
                          DataCell(Text(s['Deal Owner'] ?? '')),
                          DataCell(Text(s['Amount'] ?? '')),
                          DataCell(Text(s['Account Name'] ?? '')),
                          DataCell(Text(s['Lead Source'] ?? '')),
                          DataCell(Text(s['Expected Revenue'] ?? '')),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  iconSize: 20.0,
                                  color: Colors.green,
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  iconSize: 20.0,
                                  color: Colors.red,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void editItem(int index, _dealTableState newItem) {
    setState(() {
      deal[index] = newItem as Map<String, String>;
    });
  }
}

class ItemInformation {}
