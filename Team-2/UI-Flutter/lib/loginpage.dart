import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Loginwidget extends StatefulWidget {
  const Loginwidget({super.key});

  @override
  State<Loginwidget> createState() => _LoginwidgetState();
}

class _LoginwidgetState extends State<Loginwidget> {
  final formfiled = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool passToggle = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Container(
              child: const Image(
                image:  AssetImage("images/Background.png"),
              ),
            ),
            const Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.3,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                    child: Column(
                  children: [
                    Image.asset('images/Template.png'),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: RichText(
                        text: const TextSpan(
                          text: 'Manage Insurance',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 22),
                          children: [
                            TextSpan(
                                text: ' AWESOME ',
                                style: TextStyle(color: Colors.blue)),
                            TextSpan(text: 'Insurance')
                          ],
                        ),
                      ),
                    ),
                   const  SizedBox(
                      height: 20,
                    ),
                    buildText('Email'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          label: Text('Enter Email'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter email";
                          }
                          bool emailValidator = RegExp(
                                  r"^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
                              .hasMatch(value);
                          if (!emailValidator) {
                            return "Enter valid Email";
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildText('Password'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            label: const Text('Enter password'),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },
                              child: Icon(passToggle
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter email';
                          } else if (passwordController.text.length < 5) {
                            return 'Password length should be lessthan 6';
                          }
                        },
                      ),
                    ),
                   const  SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        login();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: const Text('forgot Password?'),
                      onTap: () => Navigator.pushReplacementNamed(
                          context, 'forgotpassword'),
                    )
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse('http://192.168.5.135:8080/verify');
    var headers = {
      'Content-Type': 'application/json',
    };
    var data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  Widget buildText(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style:const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
    );
  }
}
