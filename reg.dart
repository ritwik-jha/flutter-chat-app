import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class reg extends StatefulWidget {
  @override
  _regState createState() => _regState();
}

class _regState extends State<reg> {
  @override
  var authc = FirebaseAuth.instance;
  var email;
  var pass;
  var sspin = false;
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
              Container(
                padding: EdgeInsets.only(bottom: 80),
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple,
                  ),
                ),
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
                height: 30,
              ),
              RaisedButton(
                color: Colors.purple,
                onPressed: () async {
                  setState(() {
                    sspin = true;
                  });
                  try {
                    var user = await authc.createUserWithEmailAndPassword(
                        email: email, password: pass);

                    if (user.additionalUserInfo.isNewUser == true) {
                      Navigator.pushNamed(context, '/chat');
                      setState(() {
                        sspin = false;
                      });
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
