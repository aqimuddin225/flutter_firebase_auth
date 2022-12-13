import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_firebase_auth/auth_service.dart';
import 'package:flutter_firebase_auth/pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '‘Hello.’',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Divider(
                          thickness: 3,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 40),
                    ],
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 36,
                        letterSpacing: 5),
                  ),
                  SizedBox(height: 40),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('UID'),
                        SizedBox(height: 8),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: FirebaseAuth.instance.currentUser?.uid,
                            hintStyle: TextStyle(
                              color: Colors.black
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('Email'),
                        SizedBox(height: 8),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: FirebaseAuth.instance.currentUser?.email,
                            hintStyle: TextStyle(
                              color: Colors.black
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 40,
                child: ElevatedButton(
                  onPressed: (){
                              AuthService.signOut();
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return LoginPage();
                                }));
                              }, 
                  child: Text(
                    'Log out',
                    style: TextStyle(color: Colors.white),
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}