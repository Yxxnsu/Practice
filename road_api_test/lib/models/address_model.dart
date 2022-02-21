import 'package:road_api_test/models/common_model.dart';
import 'package:road_api_test/models/juso_model.dart';

class Address {
  final Common common;
  final List<Juso>? jusoList;
  Address({
    required this.common,
    required this.jusoList,
  });

  Map<String, dynamic> toMap() {
    return {
      'common': common.toMap(),
      'jusoList': jusoList == null 
        ? null
        : jusoList!.map((x) => x.toMap()).toList(),
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      common: Common.fromJson(json["results"]['common']),
      jusoList: json["results"]["juso"] == null 
        ? null
        : List<Juso>.from(json["results"]["juso"].map((x)=> Juso.fromJson(x)))
    );
  }
}
