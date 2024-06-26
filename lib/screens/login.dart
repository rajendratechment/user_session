import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  final String title;

  const LoginScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Form(
          key: formKey,
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
                      hintText: 'username',
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Please enter username";
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
                      labelText: 'password',
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    },
                    obscureText: true,
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
                          if(formKey.currentState!.validate()){
                            context.pushReplacement('/home');

                          }
                        },
                        child: const Text('Login '),
                      ),
                      TextButton(
                        onPressed: () {

                          context.pushReplacement('/signup');
                        },
                        child: const Text('Sign up'),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
