import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sanberappflutter/config/dio_http.dart';
import '../login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ebout extends StatefulWidget {
  const Ebout({Key? key}) : super(key: key);

  @override
  State<Ebout> createState() => _EboutState();
}

class _EboutState extends State<Ebout> {
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
        MaterialPageRoute(builder: (context) => const Login()),
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
      body: Stack(
        children: [
          Image.asset("assets/img/bgebout.png"),
          ListView(
            padding: EdgeInsets.all(16),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Rafii Ananda Putra",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 130,
                    width: 130,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white),
                    child: CircleAvatar(
                      foregroundImage: AssetImage('assets/img/raf.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 6, 98, 237),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email : prafi726@gmail.com",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "Linked : rafii_ananda_putra",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "Instagram : raf_a_p",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 98, 237),
                        borderRadius: BorderRadius.circular(15)),
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
            ],
          ),
        ],
      ),
    );
  }
}
