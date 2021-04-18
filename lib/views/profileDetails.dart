import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDetails extends StatelessWidget {
  String name;
  String phone;
  String email;
  String company;
  String location;
  String role;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.grey[700],
            size: 18,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: _fetch(),
            builder: (context, snapshot){
              if (snapshot.connectionState != ConnectionState.done)
                return Text("loading Data");
              return  Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 22.0),
                          child: Text(
                            'Profile Details',
                            style: GoogleFonts.lato(
                                color: Colors.grey[800],
                                fontSize: 26,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(40))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 13, right: 20, top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'Edit',
                                    style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 15,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        decoration: new BoxDecoration(color: Colors.white),
                        height: 180,
                        child: Stack(
                          children: <Widget>[
                            Container(
                                height: 108,
                                width: 101,
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 25, bottom: 5),
                                padding: const EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(140)),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    'https://cdn.now.howstuffworks.com/media-content/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg',
                                  ),
                                )),
                            Positioned(
                              bottom: 54,
                              right: 20, //give the values according to your requirement
                              child: Material(
                                  color: Colors.blue[900],
                                  elevation: 10,
                                  borderRadius: BorderRadius.circular(100),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.zoom_out_map,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Text(
                            'Name ',
                            style: GoogleFonts.lato(
                                color: Colors.grey[900],
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 37.0),
                          child: Text(
                            "$name",
                            style: GoogleFonts.lato(
                                color: Colors.grey[600],
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Text(
                            'Role ',
                            style: GoogleFonts.lato(
                                color: Colors.grey[900],
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 37.0),
                          child: Text(
                            '   $role',
                            style: GoogleFonts.lato(
                                color: Colors.grey[600],
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Text(
                            'Company ',
                            style: GoogleFonts.lato(
                                color: Colors.grey[900],
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(
                            '$company',
                            style: GoogleFonts.lato(
                                color: Colors.grey[600],
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Text(
                            'Location ',
                            style: GoogleFonts.lato(
                                color: Colors.grey[900],
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Text(
                            '  $location',
                            style: GoogleFonts.lato(
                                color: Colors.grey[600],
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Divider(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Icon(Icons.person),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Private Information',
                            style: GoogleFonts.lato(
                                color: Colors.grey[700],
                                fontSize: 17,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 54.0),
                          child: Icon(Icons.mail, color: Colors.grey[500]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '$email',
                            style: GoogleFonts.lato(
                                color: Colors.grey[700],
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 54.0),
                          child: Icon(Icons.phone, color: Colors.grey[500]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '$phone',
                            style: GoogleFonts.lato(
                                color: Colors.grey[700],
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 54.0),
                          child: Icon(Icons.home_outlined, color: Colors.grey[500]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '$location',
                            style: GoogleFonts.lato(
                                color: Colors.grey[700],
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      )
    );
  }


  /*



   */


  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser();
    if (firebaseUser != null)
      await Firestore.instance
          .collection('Profiles')
          .document(firebaseUser.uid)
          .get()
          .then((ds) {
        name = ds.data['name'];
        email = ds.data['email'];
        phone = ds.data['phone'];
        location = ds.data['location'];
        company = ds.data['company'];
        role = ds.data['role'];

        print(name);
      }).catchError((e) {
        print(e);
      });
  }
}
