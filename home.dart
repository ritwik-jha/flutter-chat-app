import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 50),
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'A.T.O.M.',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.purple,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 50, bottom: 50, left: 20, right: 20),
                  width: 400,
                  height: 300,
                  child: Image.network(
                    'https://media.blendernation.com/wp-content/uploads/2019/09/EEVEEBlackHole_BN.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'New here? Create a new account',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    RaisedButton(
                        color: Colors.purple,
                        child: Text('create'),
                        onPressed: () => Navigator.pushNamed(context, '/reg')),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Already a user then login',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    RaisedButton(
                        color: Colors.purple,
                        child: Text('login'),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/signin')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
