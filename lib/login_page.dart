import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  // Tulisa Hello
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        '‘Hello.’',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Divider(
                          thickness: 3,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 40),
                    ],
                  ),
                  // Tulisan Welcome back
                  const Text(
                    '‘Welcome back’',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 36,
                        letterSpacing: 5),
                  ),
                  SizedBox(height: 40),
                  // Form username & password
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '‘Email’',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: '‘Email’',
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
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
                        Text(
                          '‘Password’',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '‘Password’',
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              SignInSignUpResult result = await AuthService.createUser(email: _emailController.text, pass: _passController.text);
                              if (result.user !=null) {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return LoginPage();
                                }));
                              } else {
                                showDialog(context: context, 
                                  builder: (context)=> AlertDialog(
                                    title: Text('‘Error’'),
                                    content: Text(result.message.toString()),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('‘OK’'),
                                      )
                                    ],
                                  )
                                );
                              }
                            },
                            child: Text(
                                  '‘Login’',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                        ],
                      ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '‘OR’',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '‘Login with Google’',
                        ),
                      ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        '‘Login with Facebook’',
                        ),
                      ),
                  ),
                  SizedBox(height: 30),
                ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '‘Don\’t have account ?’',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        child: Text(
                          '‘Register here’',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
               )
             ],
           ),
        ),
       ),
     );
    }
   }