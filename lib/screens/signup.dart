import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Signup "),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image.asset("assets/img.png"),

                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your name',
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "please enter the name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your mobile no ',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return "please enter mobile no";
                        } else {
                          String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regExp = RegExp(pattern);
                          if (!regExp.hasMatch(text)) {
                            return 'Please enter valid mobile number';
                          } else {
                            return null;
                          }
                        }
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your email id ',
                    ),
                    keyboardType: TextInputType.emailAddress,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return "please enter email address";
                        } else {
                          String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = RegExp(pattern);
                          if (!regExp.hasMatch(text)) {
                            return 'Please enter valid mobile number';
                          } else {
                            return null;
                          }
                        }
                      }

                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  child: Row(
                    children: [
                      TextButton(
                        autofocus: true,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text('submit '),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}


