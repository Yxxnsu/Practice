import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:road_api_test/models/address_model.dart';
import 'dart:convert';

// class AddressRepository{
//   final logger = Logger();

//   Future<Address> searchAddress(String query) async {
//     final String url = "https://www.juso.go.kr/addrlink/addrLinkApi.do$query";
    
//     // HTTP 할 때  Uri로 parse.
//     final response = await http.get(Uri.parse(url));

//     String bodyString = utf8.decode(response.bodyBytes);
//     Map<String,dynamic> body = jsonDecode(bodyString);

//     // logger.d(body);
    
//     return Address.fromJson(body);

//   }  
// }


class AddressRepository{
  final logger = Logger();

  Future<Address> searchAddress(String query) async {
    final String url = "https://www.juso.go.kr/addrlink/addrLinkApi.do$query";
    
    // HTTP 할 때  Uri로 parse.
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      Map<String,dynamic> body = json.decode(response.body);
      logger.d(body);
      // logger.d(body is Map);
      return Address.fromJson(body);
    } else {
      throw Exception('Failed to load post');
    }
  }  
}
