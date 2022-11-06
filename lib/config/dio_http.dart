import 'package:dio/dio.dart';
import 'base_url.dart';

class DioHttp {
  //this is standarized request for everyone
  static Map<String, dynamic> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  static Dio request = Dio(BaseOptions(
    //validatestatus: (status)=>status! <= 500,
    baseUrl: baseUrl,
    headers: headers,
  ));
}
