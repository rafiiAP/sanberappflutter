import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sanberappflutter/config/dio_http.dart';
import '../login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var temp = "";
  void initState() {
    //  readLocalStorage();
    super.initState();
  }

  // Future<Null> readLocalStorage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? userToken = prefs.getString("user-token");
  //   setState(() {
  //     temp == userToken;
  //   });
  //   print(userToken);
  // }

  Future<dynamic> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString("user-token");
    setState(() {
      temp == userToken;
    });
    try {
      print(":Logout");
      var respose = await DioHttp.request.post("/api/logout",
          options: Options(headers: {"authorization": "Bearer $userToken"}));
      //"Authorization" :"Bearer $userToken") ;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      print("gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Home"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Selamat Datang, rafii",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff475BD7),
                  borderRadius: BorderRadius.circular(5)),
              child: TextButton(
                onPressed: () {
                  _logout();
                },
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
