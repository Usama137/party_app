import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partyapp/components/rounded_button.dart';
import 'package:partyapp/components/sizes_helpers.dart';
import 'package:partyapp/views/navigationBar.dart';
import 'package:partyapp/views/register.dart';

class Login extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final _auth = FirebaseAuth.instance;
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnackBar(String message) {
    final snackBar = SnackBar(
        content: Text(
      message,
      textAlign: TextAlign.center,
    ));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void login() async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (user != null) {
        Navigator.pushNamed(context, MyNavigationBar.id);
      }
    } on PlatformException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        showSnackBar(e.message);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        showSnackBar(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        //physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: displayHeight(context) * 0.15,
              ),
              Image(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                image: AssetImage('images/logo.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "PARTY NETWORK",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email address',
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10)),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10)),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedButton(
                      buttonColor: Colors.red,
                      textColor: Colors.white,
                      title: 'Login',
                      buttonWidth: displayWidth(context) * 0.80,
                      onPressed: () {
                        login();
                      },
                    )
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Register.id, (route) => false);
                },
                child: Text("Don\'t have an account, Register here"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
