import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String usernamefield = "";
  String passwordfield = "";

  final logo = Image.asset(
    "assets/doodle.png",
    height: 150,
    width: 220,
  );

  void logindata() async {
    print(usernamefield);
    print(passwordfield);
    String url = "https://k.qbox.dev/v1/user/token/";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept-Encoding': 'gzip, deflate',
        'Connection': 'keep-alive',
      },
      body: {"username": "ali", "password": "ali123456"},
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      Navigator.pushReplacementNamed(context, '/profile');
    }

    //print(response.body);
    //print(jsonDecode(response.body)["refresh"]);
  }

  @override
  Widget build(BuildContext context) {
    final username = TextFormField(
      autofocus: false,
      onChanged: (String value) {
        usernamefield = value;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      onChanged: (String value) {
        passwordfield = value;
      },
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            logo,
            SizedBox(
              height: 50,
            ),
            username,
            SizedBox(
              height: 20,
            ),
            password,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: TextButton(
                onPressed: logindata,
                child: Text("log in"),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text("Signup"),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
