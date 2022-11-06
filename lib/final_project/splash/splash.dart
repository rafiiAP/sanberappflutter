import 'package:flutter/material.dart';
import '../login/login.dart';
import '../main_app/main_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    autoLogin();
    super.initState();
  }

  Future<void> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString("user-token");
    if (userToken != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainApp()),
        );
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/img/logo1.png",
                  height: 130,
                  width: 130,
                ),
                SizedBox(
                  height: 15,
                ),
                CircularProgressIndicator()
              ])),
    );
  }
}
