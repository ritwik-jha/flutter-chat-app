import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  var msgtextcontroller = TextEditingController();
  var fs = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;

  String chatmsg;
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var signinuser = authc.currentUser.email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Nucleus',
          style: TextStyle(
            color: Colors.purple,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () async {
                print("sign off");
                await authc.signOut();
                Navigator.pushNamed(context, "/");
              }),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                builder: (context, snapshot) {
                  var msg = snapshot.data.docs;
                  List<Widget> y = [];

                  for (var d in msg) {
                    var msgText = d.data()['text'];
                    var msgSender = d.data()['sender'];
                    var msgWidget = Text("$msgSender : $msgText");

                    y.add(msgWidget);
                  }

                  return Container(
                    /*child: Column(
                        children: y,
                      ),
                    );*/
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(8),
                        itemCount: y.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            //padding: EdgeInsets.only(bottom: 8),
                            color: Colors.purple,
                            child: ListTile(
                              title: y[index],
                            ),
                          );
                        }),
                  );
                },
                stream: fs.collection("chat").orderBy("timestamp").snapshots(),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: deviceWidth * 0.70,
                  child: TextField(
                    controller: msgtextcontroller,
                    decoration: InputDecoration(hintText: 'Enter msg ..'),
                    onChanged: (value) {
                      chatmsg = value;
                    },
                  ),
                ),
                Container(
                  width: deviceWidth * 0.20,
                  child: FlatButton(
                    child: Text('send'),
                    onPressed: () async {
                      msgtextcontroller.clear();

                      await fs.collection("chat").add({
                        "text": chatmsg,
                        "sender": signinuser,
                        "timestamp": Timestamp.now(),
                      });
                      print(signinuser);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
