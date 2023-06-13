import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  bool _isExtended = false;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables

    const isSelected = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 236, 241, 240),
          title: const Text(
            'Insurance Ltd',
            style: TextStyle(color: Color.fromARGB(255, 10, 19, 17)),
          ),
          actions: const <Widget>[
            IconButton(onPressed: null, icon: Icon(Icons.notification_add)),
            IconButton(onPressed: null, icon: Icon(Icons.logout_outlined))
          ],
        ),
        body: const CardExample(),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(109, 43, 43, 41),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      trailing: Icon(
                        Icons.expand_circle_down_outlined,
                        color: Colors.white,
                      ),
                    ),
                    // Container(
                    //   color: Colors.amber,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       Container(
                    //         padding: const EdgeInsets.all(10.0),
                    //         child: const Text(
                    //           'RFQ',
                    //           style:
                    //               TextStyle(color: Colors.white, fontSize: 22),
                    //         ),
                    //       ),
                    //       ExpandIcon(
                    //         isExpanded: _isExtended,
                    //         color: Colors.white,
                    //         expandedColor: Colors.black,
                    //         onPressed: (bool isExpanded) {
                    //           setState(() {
                    //             _isExtended = !isExpanded;
                    //           });
                    //         },
                    //       )
                    //     ],
                    //   ),
                    // ),

                    const ListTile(
                      leading: Icon(
                        Icons.music_video_sharp,
                        color: Colors.white,
                      ),
                      title: Text('RFQ',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      trailing: Icon(
                        Icons.expand_circle_down_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.file_copy,
                        color: Colors.white,
                      ),
                      title: Text('Client list',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      trailing: Icon(
                        Icons.expand_circle_down_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text('Intermideary Details',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      trailing: Icon(
                        Icons.expand_circle_down_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.charging_station,
                        color: Colors.white,
                      ),
                      title: Text('Templates',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      trailing: Icon(
                        Icons.expand_circle_down_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.data_array,
                        color: Colors.white,
                      ),
                      title: Text('Application Data',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      trailing: Icon(
                        Icons.expand_circle_down_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.details,
                        color: Colors.white,
                      ),
                      title: Text('Application Details',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      trailing: Icon(
                        Icons.expand_circle_down_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                      title: Text('Lead',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      trailing: Icon(
                        Icons.expand_circle_down_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.format_shapes,
                        color: Colors.white,
                      ),
                      title: Text('BCIT Forms',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      trailing: Icon(
                        Icons.expand_circle_down_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const ListTile(
                      // ignore: dead_code
                      tileColor: isSelected ? Colors.blue : null,
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      title: Text('Tasks',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      trailing: Icon(
                        Icons.expand_circle_down_outlined,
                        color: Colors.white,
                      ),
                    ),
                    // Container(
                    //   color: Colors.amber,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       Container(
                    //         padding: const EdgeInsets.all(10.0),
                    //         child: const Text(
                    //           'RFQ',
                    //           style:
                    //               TextStyle(color: Colors.white, fontSize: 22),
                    //         ),
                    //       ),
                    //       ExpandIcon(
                    //         isExpanded: _isExtended,
                    //         color: Colors.white,
                    //         expandedColor: Colors.black,
                    //         onPressed: (bool isExpanded) {
                    //           setState(() {
                    //             _isExtended = !isExpanded;
                    //           });
                    //         },
                    //       )
                    //     ],
                    //   ),
                    // ),
                    if (_isExtended)
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: Text('Flutter Mapp'),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Column(children: <Widget>[]));
  }
}
