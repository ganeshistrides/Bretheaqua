import 'package:aqua/Provider/Loginprovider.dart';
import 'package:aqua/Provider/Profileupdateprovider.dart';
import 'package:aqua/Provider/signupprovider.dart';
import 'package:aqua/Screens/Splashscreenmain.dart';
import 'package:aqua/connection/SharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Aqua extends StatefulWidget {
  const Aqua({Key key}) : super(key: key);

  @override
  _AquaState createState() => _AquaState();
}

class _AquaState extends State<Aqua> {
  @override
  Widget build(BuildContext context) {
    return Splashscreenload();
  }
}

class Splashscreenload extends StatefulWidget {
  @override
  _SplashscreenloadState createState() => _SplashscreenloadState();
}

class _SplashscreenloadState extends State<Splashscreenload> {
  SharedPrefManager prefManger = SharedPrefManager();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Loginprovider>(
            create: (context) => Loginprovider()),
        ChangeNotifierProvider<SignupProvider>(
            create: (context) => SignupProvider()),
        ChangeNotifierProvider<ProfileProvider>(
            create: (context) => ProfileProvider())
      ],
      child: MaterialApp(
        home: Splashscreenmain(),
      ),
    );
  }
}
