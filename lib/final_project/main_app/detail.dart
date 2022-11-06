import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetDetail extends StatefulWidget {
  final int? value;
  const GetDetail({Key? key, this.value}) : super(key: key);

  @override
  _GetDetailState createState() => _GetDetailState(value);
}

class _GetDetailState extends State<GetDetail> {
  int? value;
  _GetDetailState(this.value);
  Map? data;
  String? uri;

  @override
  void initState() {
    var url =
        'http://makeup-api.herokuapp.com/api/v1/products/${value.toString()}.json';
    _getRefreshData(url);
    super.initState();
    print('Cek parameter +${value.toString()}');
  }

  Future<void> _getRefreshData(url) async {
    getJsonData(context, url);
  }

  Future<void> getJsonData(BuildContext context, url) async {
    setState(() {
      uri = url;
    });
    var response = await http
        .get(Uri.parse(uri.toString()), headers: {'Accept': 'aplication/json'});
    print(response.body);
    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: data == null
            ? Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Loading...',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            : Stack(
                children: [
                  Image.network(
                    data!["image_link"],
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: 450),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 6,
                                    child: Text(
                                      data!['name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Text(data!['rating'].toString(),
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text('by  ', style: TextStyle(fontSize: 16)),
                                Text(data!['brand'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              data!['description'],
                              textAlign: TextAlign.justify,
                            ),
                            //const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$' + data!['price'],
                                    style: TextStyle(fontSize: 20)),
                                ElevatedButton(
                                  // ignore: sort_child_properties_last
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("You pressed buy ;"),
                                    ));
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 40)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const BtnFavorite(),
                      ],
                    ),
                  ),
                ],
                // child: ListTile(
                //   leading: Image.network(data!['avatar']),
                //   title: Text(data!['first_name'] + " " + data!['last_name']),
                //   subtitle: Text(data!['email']),
                // ),
              ),
      ),
    );
  }
}

class BtnFavorite extends StatefulWidget {
  const BtnFavorite({super.key});

  @override
  State<BtnFavorite> createState() => _BtnFavorite();
}

class _BtnFavorite extends State<BtnFavorite> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
