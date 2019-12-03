import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:followup/screens/registration.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  String emailId = '';

  String password = '';

  bool isLoading = false;

  FirebaseUser user;

  void getCurrentUser() async {
    try {
      user = await _auth.currentUser();

      if (user != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home(uid: user.uid)),
            (Route<dynamic> route) => false);
      }

      print(user.email);
    } catch (e) {}
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.red,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Image.asset('assets/images/handshake.png'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      color: Color(0x33000000),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Follow UP',
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                emailId = value;
                              },
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Email Id',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextField(
                              onChanged: (value) {
                                password = value;
                              },
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: FlatButton(
                                color: Color(0x33000000),
                                child: Text('Login'),
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  print(emailId + ' ' + password);

                                  try {
                                    AuthResult result =
                                        await _auth.signInWithEmailAndPassword(
                                            email: emailId, password: password);

                                    setState(() {
                                      isLoading = false;
                                    });

                                    if (result != null) {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Home(uid: result.user.uid)),
                                          (Route<dynamic> route) => false);
                                    }
                                  } catch (e) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }

//                                Navigator.pushAndRemoveUntil(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => Home()),
//                                    (Route<dynamic> route) => false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FlatButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => Registration());
                      },
                      child: Text(
                        'Registor new account',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0x99FFFFFF)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
