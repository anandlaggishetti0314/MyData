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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Row(
            children: [
              Container(
                width: screenWidth * 0.3,
                height: screenHeight * 0.4,
                child: const Image(
                  image: AssetImage("images/Background.png"),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Expanded(
                  child: Form(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(250, 60, 250, 60),
                  child: Container(
                    width: screenWidth * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('images/Template.png'),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: const TextSpan(
                            text: 'Manage Your ',
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
                        const SizedBox(
                          height: 20,
                        ),
                        buildText('Email'),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                              key: formfiled,
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
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        buildText('Password'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: passToggle,
                            decoration: InputDecoration(
                                label: const Text('Enter Password'),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      passToggle = !passToggle;
                                    });
                                  },
                                  child: Icon(!passToggle
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
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
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
                        const SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          title: const Text('forgot Password?'),
                          onTap: () => Navigator.pushReplacementNamed(
                              context, 'forgotpassword'),
                        )
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
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
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
    );
  }
}
