import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class sign extends StatefulWidget {
  @override
  _signState createState() => _signState();
}

class _signState extends State<sign> {
  var email;
  var pass;
  var sspin = false;
  var authc = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ModalProgressHUD(
        inAsyncCall: sspin,
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter your login details',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: 'email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  pass = value;
                },
                decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  color: Colors.purple,
                  child: Text('submit'),
                  onPressed: () async {
                    setState(() {
                      sspin = true;
                    });
                    try {
                      var userin = await authc.signInWithEmailAndPassword(
                          email: email, password: pass);
                      if (userin != null) {
                        Navigator.pushNamed(context, '/chat');
                        setState(() {
                          sspin = false;
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
