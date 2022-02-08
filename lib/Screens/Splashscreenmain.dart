import 'dart:async';

import 'package:aqua/Screens/loginscreen.dart';
import 'package:aqua/Screens/profileupdate.dart';
import 'package:aqua/connection/SharedPreferences.dart';
import 'package:flutter/material.dart';

class Splashscreenmain extends StatefulWidget {
  const Splashscreenmain({Key key}) : super(key: key);

  @override
  _SplashscreenmainState createState() => _SplashscreenmainState();
}

class _SplashscreenmainState extends State<Splashscreenmain> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 4000), () async {
      SharedPrefManager prefManger = SharedPrefManager();

      if (await prefManger.getLoggedIn()) {
        print("ganesh");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileUpdate()),
        );
      } else {
        print("mohan");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Loginscreen()),
        );
      }
    });

    Timer(Duration(milliseconds: 600), () {
      setState(() {
        //_opacity = 1.0;
        //_value = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Brethe aqua"),
              SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
