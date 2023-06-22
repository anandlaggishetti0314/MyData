import 'package:flutter/material.dart';
class ForGotWidget extends StatefulWidget {
  const ForGotWidget({super.key});
  @override
  State<ForGotWidget> createState() => _ForGotWidgetState();
}
class _ForGotWidgetState extends State<ForGotWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
      child: Container(
        width: screenWidth * 0.4,
        height: screenHeight * 0.4,
        child: Column(
          children: [
            RichText(
                text: TextSpan(
                    text: 'Forgot Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    ),
                    ),
            SizedBox(
              height: 50,
            ),
            buildText('Email'),
            TextField(
              decoration: InputDecoration(
                  label: Text('Enter Email'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: ElevatedButton(
              onPressed: () {},
              child: Text('submit'),
            ))
          ],
        ),
      ),
    ));
  }
}
Widget buildText(String text) {
  return Align(
    alignment: Alignment.topLeft,
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 15,
      ),
    ),
  );
}
