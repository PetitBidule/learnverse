import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log in')),
      backgroundColor: const Color.fromRGBO(117, 123, 200, 1),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 64.0),
              child: Text('log in to your account',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 250,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      hintText: 'Email'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: SizedBox(
                width: 250,
                height: 60,
                child: TextField(
                  style:
                      const TextStyle(color: Color.fromARGB(255, 255, 255, 0)),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      hintText: 'Password'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text('forgot your password ?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 10,
                    fontWeight: FontWeight.w200,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.8),
                    )),
              ),
            )
          ],
        ),
      )),
    );
  }
}
