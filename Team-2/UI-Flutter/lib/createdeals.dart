import 'dart:collection';

import 'package:flutter/material.dart';

class TableRowData {
  String SNo;
  String DealName;
  String DealOwner;
  String Amount;
  String AccountName;
  String LeadSource;
  String ExpectedRevenue;

  TableRowData({
    required this.SNo,
    required this.DealName,
    required this.DealOwner,
    required this.Amount,
    required this.AccountName,
    required this.LeadSource,
    required this.ExpectedRevenue,
  });
}

class CrudPage extends StatefulWidget {
  @override
  _CrudPageState createState() => _CrudPageState();
}

class FormFieldConfig {
  final String labelText;
  final TextEditingController controller;

  FormFieldConfig({required this.labelText, required this.controller});
}

class _CrudPageState extends State<CrudPage> {
  List<TableRowData> items = [];
  List<FormFieldConfig> formFields = [
    FormFieldConfig(labelText: 'S.No', controller: TextEditingController()),
    FormFieldConfig(
        labelText: 'Deal Name', controller: TextEditingController()),
    FormFieldConfig(
        labelText: 'Deal Owner', controller: TextEditingController()),
    FormFieldConfig(labelText: 'Amount', controller: TextEditingController()),
    FormFieldConfig(
        labelText: 'Account Name', controller: TextEditingController()),
    FormFieldConfig(
        labelText: 'Lead Source', controller: TextEditingController()),
    FormFieldConfig(
        labelText: 'Expected Revenue', controller: TextEditingController()),
  ];

  void addItem(TableRowData item) {
    setState(() {
      items.add(item);
    });
  }

  void editItem(int index, TableRowData newItem) {
    setState(() {
      items[index] = newItem;
    });
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  Future<TableRowData?> showAddDialog() async {
    List<TextEditingController> controllers = formFields.map((config) {
      return TextEditingController();
    }).toList();

    return showDialog<TableRowData>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Deals'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: formFields.asMap().entries.map((entry) {
              int index = entry.key;
              FormFieldConfig config = entry.value;
              return TextFormField(
                controller: controllers[index],
                decoration: InputDecoration(labelText: config.labelText),
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                TableRowData newItem = TableRowData(
                  SNo: controllers[0].text,
                  DealName: controllers[1].text,
                  DealOwner: controllers[2].text,
                  Amount: controllers[3].text,
                  AccountName: controllers[4].text,
                  LeadSource: controllers[5].text,
                  ExpectedRevenue: controllers[6].text,
                );
                Navigator.pop(context, newItem);
              },
            ),
          ],
        );
      },
    );
  }

  Future<TableRowData?> showEditDialog(TableRowData currentItem) async {
    List<TextEditingController> controllers = formFields.map((config) {
      return TextEditingController();
    }).toList();

    controllers[0].text = currentItem.SNo;
    controllers[1].text = currentItem.DealName;
    controllers[2].text = currentItem.DealOwner;
    controllers[3].text = currentItem.Amount;
    controllers[4].text = currentItem.AccountName;
    controllers[5].text = currentItem.LeadSource;
    controllers[6].text = currentItem.ExpectedRevenue;

    return showDialog<TableRowData>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Deal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: formFields.asMap().entries.map((entry) {
              int index = entry.key;
              FormFieldConfig config = entry.value;
              return TextFormField(
                controller: controllers[index],
                decoration: InputDecoration(labelText: config.labelText),
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                TableRowData newItem = TableRowData(
                  SNo: controllers[0].text,
                  DealName: controllers[1].text,
                  DealOwner: controllers[2].text,
                  Amount: controllers[3].text,
                  AccountName: controllers[4].text,
                  LeadSource: controllers[5].text,
                  ExpectedRevenue: controllers[6].text,
                );
                Navigator.pop(context, newItem);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteDialog(int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Lead'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.pop(context);
                deleteItem(index);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('S.No')),
            DataColumn(label: Text('Deal Name')),
            DataColumn(label: Text('Deal Owner')),
            DataColumn(label: Text('Amount')),
            DataColumn(label: Text('Account Name')),
            DataColumn(label: Text('Lead Source')),
            DataColumn(label: Text('Expected Revenue')),
            DataColumn(label: Text('Action')),
          ],
          rows: items.map((item) {
            return DataRow(cells: [
              DataCell(Text(item.SNo)),
              DataCell(Text(item.DealName)),
              DataCell(Text(item.DealOwner)),
              DataCell(Text(item.Amount)),
              DataCell(Text(item.AccountName)),
              DataCell(Text(item.LeadSource)),
              DataCell(Text(item.ExpectedRevenue)),
              DataCell(Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      TableRowData? newItem = await showEditDialog(item);
                      if (newItem != null) {
                        editItem(items.indexOf(item), newItem);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      showDeleteDialog(items.indexOf(item));
                    },
                  ),
                ],
              )),
            ]);
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          TableRowData? newItem = await showAddDialog();
          if (newItem != null) {
            addItem(newItem);
          }
        },
      ),
    );
  }
}
