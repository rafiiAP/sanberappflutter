import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sanberappflutter/config/dio_http.dart';
import '../login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late String? name;
  late String? username;
  late String? email;
  late String? password;
  late bool _isloading = false;

  Future<dynamic> _RegisterSubmit() async {
    var data = {
      "name": name,
      "username": username,
      "email": email,
      "password": password
    };
    try {
      print(data);
      setState(() {
        _isloading = true;
      });
      var response = await DioHttp.request.post("/api/register", data: data);
      print(response.data);

      setState(() {
        _isloading = false;
      });
      final snackBar = SnackBar(
        content: const Text('Data Berhasil Disimpan'),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
      Get.to(Login());
    } on DioError catch (dioError) {
      var message = "";
      switch (dioError.response!.statusCode) {
        case 422:
          Map<String, dynamic> _errorData = dioError.response!.data['errors'];
          var getListMessage = _errorData.values;
          var result = getListMessage.map((item) =>
              item.toString().substring(1, item.toString().length - 2));
          setState(() {
            _isloading = false;
          });
          message = result.join("\n");
          break;
        case 404:
          setState(() {
            _isloading = false;
          });
          message = "Server Not Found";
          break;
        default:
          setState(() {
            _isloading = false;
          });
          message = "Server Error";
      }
      final snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: LoadingOverlay(
          isLoading: _isloading,
          child: Container(
            // color: Colors.amber,
            padding: const EdgeInsets.all(16),
            child: Container(
              alignment: Alignment.center,
              //  color: Colors.amber,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height / 10,
                        //color: Colors.amber,
                        child: Image.asset(
                          "assets/img/logo1.png",
                          height: 100,
                          width: 100,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          validator: (String? nameValue) {
                            if (nameValue!.isEmpty) {
                              return "enter name text";
                            }
                            name = nameValue;
                            return null;
                          },
                          decoration: const InputDecoration(
                            // hintText: "Masukan nama anda",
                            labelText: "Name",
                            hintStyle: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          validator: (String? userNameValue) {
                            if (userNameValue!.isEmpty) {
                              return "enter name text";
                            }
                            username = userNameValue;
                            return null;
                          },
                          decoration: const InputDecoration(
                            //   border: InputBorder.none,

                            labelText: "Username",
                            hintStyle: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          validator: (String? emailValue) {
                            if (emailValue!.isEmpty) {
                              return "enter Email text";
                            }
                            email = emailValue;
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Email",
                            hintStyle: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                            validator: (String? passwordValue) {
                              if (passwordValue!.isEmpty) {
                                return "enter name text";
                              }
                              password = passwordValue;
                              return null;
                            },
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              // hintText: "Masukan Email Password anda",
                              hintStyle: const TextStyle(color: Colors.black),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              //  prefixIcon: Icon(Icons.lock),
                              labelText: "Password ",
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text("Sudah Punya akun?"),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Masuk"),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 98, 237),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: TextButton(
                        child: const Text(
                          "Daftar",
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _RegisterSubmit();
                          }
                        },
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
