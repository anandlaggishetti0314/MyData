import "package:flutter/material.dart";

void main() {
  runApp(EmployeeData());
}

class EmployeeData extends StatelessWidget {
  EmployeeData({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 30.0, left: 30.0),
          child: Column(
            children: [
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      fixedSize: Size(screenWidth * 0.23, 30.0),
                    ),
                    child: const Text(
                      "claims Data",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(178, 12, 11, 11),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  OutlinedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      fixedSize: Size(screenWidth * 0.28, 30.0),
                    ),
                    child: const Text(
                      "Client Employee Data",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(178, 12, 11, 11),
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  OutlinedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      fixedSize: Size(screenWidth * 0.23, 30.0),
                    ),
                    child: const Text(
                      "Excel Values",
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(178, 12, 11, 11),
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Container(
                      width: screenWidth * 0.3,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SecondRow(),
                  SizedBox(width: screenWidth * 0.5),
                  Insurer(),
                  SizedBox(width: screenWidth * 0.01),
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[400],
                      ),
                      child: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                children: <Widget>[
                  DataTable(
                    columns: const [
                      DataColumn(
                        label: Text(
                          'S.No',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Key',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text('Excel Value',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                      DataColumn(
                        label: Text('Type',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                      DataColumn(
                        label: Text('TPA',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                      DataColumn(
                        label: Text('Required',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                      DataColumn(
                        label: Text('Actions',
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          const DataCell(Text('01')),
                          const DataCell(Text('22')),
                          const DataCell(Text('22')),
                          const DataCell(Text('22')),
                          const DataCell(Text('22')),
                          const DataCell(Text('Yes')),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  onPressed: editwidget,
                                  icon: Icon(Icons.edit),
                                  color: Colors.blue,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      DataRow(
                        cells: [
                          const DataCell(Text('01')),
                          const DataCell(Text('22')),
                          const DataCell(Text('22')),
                          const DataCell(Text('22')),
                          const DataCell(Text('22')),
                          const DataCell(Text('Yes')),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  onPressed: editwidget,
                                  icon: Icon(Icons.edit),
                                  color: Colors.blue,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void editwidget() {}
}

class SecondRow extends StatefulWidget {
  const SecondRow({super.key});

  @override
  State<SecondRow> createState() => SecondRowState();
}

class SecondRowState extends State<SecondRow> {
  String? states;

  List<String> dropDownList = [
    "S.No",
    "Excel Value",
    "Type",
    "TPA",
    "Required",
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Flexible(
      child: Container(
        width: screenWidth * 0.3,
        child: const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: SizedBox(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'filter by',
                suffixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Insurer extends StatefulWidget {
  const Insurer({super.key});

  @override
  State<Insurer> createState() => _InsurerState();
}

class _InsurerState extends State<Insurer> {
  bool showBox = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text('Claims'),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.green,
                        thickness: 1.0,
                      ),
                    ],
                  ),
                  actions: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "select Key",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'selectKey',
                            contentPadding: EdgeInsets.all(5.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter Excel Value",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Excel Value',
                            contentPadding: EdgeInsets.all(5.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select TPA",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextField(
                          style: TextStyle(fontSize: 15.0),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Select TPA',
                            contentPadding: EdgeInsets.all(5.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Divider(
                      color: Colors.green,
                      thickness: 1.0,
                    ),
                    SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Add Product'),
                    ),
                  ],
                );
              },
            );
          },
          child: Row(
            children: [
              Container(
                height: 15.0,
                child: Text('Create Insurer'),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
        ),
        SizedBox(height: 20),
        if (showBox)
          Container(
            width: 600,
            height: 600,
            color: Colors.red,
          ),
      ],
    );
  }
}
