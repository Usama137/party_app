//import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login.dart';
import 'package:partyapp/components/sizes_helpers.dart';
import 'package:partyapp/components/rounded_button.dart';

class Register extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  final _auth = FirebaseAuth.instance;
  final databaseReference = Firestore.instance;

  void showSnackBar(String message) {
    final snackBar = SnackBar(
        content: Text(
      message,
      textAlign: TextAlign.center,
    ));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  var nameController = TextEditingController();

  var roleController = TextEditingController();

  var companyController = TextEditingController();

  var locationController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  /*

  void registerUser() async {
    final User user = (await _auth
        .createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text)
        .catchError((ex) {
      PlatformException thisEx = ex;
      showSnackBar(thisEx.message);
    }))
        .user;
    if (user != null) {
      print('success');
      DatabaseReference newUserRef =
      FirebaseDatabase.instance.reference().child('users/${user.uid}');
      Map userMap = {
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
      };
      print(nameController.text);
      newUserRef.set(userMap);
      Navigator.pushNamedAndRemoveUntil(context, Login.id, (route) => false);
    }
  }

  */



  void registerUser() async {
    try {
      final FirebaseUser currentUser = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text))
          .user;
      Firestore.instance
          .collection("Profiles")
          .document(currentUser.uid)
          .setData({
        "uid": currentUser.uid,
        'email': emailController.text,
        'name': nameController.text,
        'phone': phoneController.text,
        'role': roleController.text,
        'company': companyController.text,
        'location': locationController.text,
      });


      if (currentUser != null) {
        Navigator.pushNamed(context, Login.id);
      }
    } catch (e) {
      print(e);
      showSnackBar(e.message);
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
                "Register",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    //name
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'Full name',
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10)),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //role
                    TextField(
                      controller: roleController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'Role',
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10)),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //company
                    TextField(
                      controller: companyController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'Company',
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10)),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //location
                    TextField(
                      controller: locationController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'Location',
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10)),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //email
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

                    //phone
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10)),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //password
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
                      title: 'Register',
                      buttonWidth: displayWidth(context) * 0.80,
                      onPressed: () {

                        registerUser();
                        /*

                        var connectivityResult =
                        await Connectivity().checkConnectivity();
                        if (connectivityResult != ConnectivityResult.mobile &&
                            connectivityResult != ConnectivityResult.wifi) {
                          showSnackBar('No internet');
                          return;


                        }

                        if (nameController.text.length < 3) {
                          showSnackBar('Enter valid name');
                          return;
                        }
                        if (phoneController.text.length < 10) {
                          showSnackBar('Enter valid phone number');
                          return;
                        }
                        if (passwordController.text.length < 8) {
                          showSnackBar('Enter valid password');
                          return;
                        }
                        if (!emailController.text.contains('@')) {
                          showSnackBar('Enter valid email');
                          return;
                        }

                        registerUser();


                        */
                      },
                    )
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Login.id, (route) => false);
                },
                child: Text("Already have an account, Login here"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
