import 'package:road_api_test/models/common_model.dart';
import 'package:road_api_test/models/juso_model.dart';
import 'dart:developer' as developer;

class Address {
  final Common common;
  final List<Juso> jusoList;
  Address({
    required this.common,
    required this.jusoList,
  });

  Map<String, dynamic> toMap() {
    return {
      'common': common.toMap(),
      'jusoList': jusoList.map((x) => x.toMap()).toList(),
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {

    final results = json['results'];
    // print(results['juso'] == null);
    List<Juso> jusoList = [];
    print(jusoList == null);

    if(results['juso'] != null && results['common'] != null){
      final jusoJusoList = results['juso'] as List;
      jusoList = jusoJusoList.map((item) => Juso.fromJson(item)).toList();
      // developer.log('${jusoJusoList.length}');
      // jusoJusoList.map((e)=> developer.log('eeeeeeeeeeee'));
      // jusoJusoList.forEach((element)=> developer.log('eeeeeeeeeeee'));
    }
    return Address(
      common: Common.fromJson(json['common']),
      jusoList: jusoList,
    );
  }
}
