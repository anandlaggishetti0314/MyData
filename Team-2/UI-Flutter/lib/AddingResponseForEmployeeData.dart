import "package:flutter/material.dart";
import "package:insurenceproject/claimsData.dart";

import "Table.dart";

void main() {
  runApp(AddingResponseEmployeeData());
}

class AddingResponseEmployeeData extends StatelessWidget {
  AddingResponseEmployeeData({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 30.0, left: 30.0),
          child: Column(
            children: [
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Table();
                    },
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
                    child: SizedBox(
                      width: screenWidth * 0.29,
                      child: const TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          hintStyle: TextStyle(fontSize: 10.0),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(color: Color.fromARGB(247, 0, 0, 0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ),
                  SizedBox(width: screenWidth * 0.02),
                  SecondRow(),
                  SizedBox(width: screenWidth * 0.25),
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
              const Row(
                children: [
                  TableData(),
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
        width: screenWidth * 0.29,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: SizedBox(
            child: DropdownButton(
              value: states,
              onChanged: (value) => {},
              items: dropDownList.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              isExpanded: true,
              underline: SizedBox(),
              icon: Icon(Icons.arrow_drop_down),
              hint: Text('Filter By'),
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
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
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
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(),
                child: const Text('Create Insurer'),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        if (showBox)
          Container(
            width: screenWidth * 0.29,
            height: screenHeight * 0.150,
            // width: 600,
            // height: 600,
            color: Colors.red,
          ),
      ],
    );
  }
}
