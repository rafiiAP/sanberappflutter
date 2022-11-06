import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sanberappflutter/Tugas/tugas14/get_detail.dart';

//import 'package:auth_google_email_password/Tugas/Tugas14/get_data.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  final String url = "https://reqres.in/api/users?page=2";
  List? data;
  @override
  void initState() {
    _getRefreshDaata();
    super.initState();
  }

  Future<void> _getRefreshDaata() async {
    this.getJsonData(context);
  }

  Future<void> getJsonData(BuildContext context) async {
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "aplication/json"});
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get data api regres"),
      ),
      body: RefreshIndicator(
        onRefresh: _getRefreshDaata,
        child: data == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: data == null ? 0 : data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GetDetail(value: data![index]["id"])),
                            );
                            print(data![index]["id"]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    data![index]["avatar"],
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  children: [
                                    Text(data![index]["first_name"] +
                                        " " +
                                        data![index]["last_name"]),
                                    Text(data![index]["email"]),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
