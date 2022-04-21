import 'dart:convert';

import 'package:flutter/material.dart';

import '../API Connection/LoginApi.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // _login() async {
  //   var logindata = {
  //     'email': emailController,
  //     'password': passwordController,
  //   };
  //   var res = callLoginapi().postData(logindata, 'login');
  //   var newbody = json.decode(res.body);

  //   if (newbody['errorMessage'] == false) {
  //     if (newbody['message'] != null) {
  //       print("Success");
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("Assets/lonewolf.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Login",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(Icons.email_outlined),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: 'Email Address',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(Icons.lock),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 300,
                    child: TextField(
                      controller: passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Your Password ?",
                        style:
                            TextStyle(fontSize: 11, color: Colors.amber[600]),
                      ))),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    onPressed: () {
                      // _login();
                    },
                    color: Colors.amber[600],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
