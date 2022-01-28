import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:road_api_test/models/address_model.dart';
import 'package:road_api_test/models/error_model.dart';
import 'package:road_api_test/models/juso_model.dart';
import 'package:road_api_test/repository/address_repo.dart';

class AddressController extends GetxController{

  static const apiKey = 'devU01TX0FVVEgyMDIyMDEyNzE3MjkyNDExMjE5MDE=';

  final addrEdit = TextEditingController();
  final scrollController = ScrollController();

  final keyword = ''.obs, errorMessage = '검색어를 입력하세요.'.obs;
  
  final page = 0.obs;

  final _addressList = <Juso>[].obs;

  List<Juso> get addressList => _addressList;

  @override
  void onInit() {
    addScrollListener();
    // addTextEditListener();
    super.onInit();
  }

  Future<void> fetchAddress(String keyword, int pageNumber) async {

    final logger = Logger();

    String? query;
    AddressRepository _addressRepository = AddressRepository();
    ErrorModel? _error;

    query = httpGetQuery(query, "confmKey", apiKey);
    query = httpGetQuery(query, "currentPage", '$pageNumber');
    query = httpGetQuery(query, "countPerPage", '10');
    query = httpGetQuery(query, "keyword", keyword);
    query = httpGetQuery(query, "resultType", 'json');

    // logger.d(query);

    try{

      Address address = await _addressRepository.searchAddress(query!);
      logger.d(address.common);
      logger.d('eeeeeee');

      if(address.jusoList.isEmpty && address.common.errorCode == '0'){
        throw _error = ErrorModel(statusCode: 0, error: -101, meassge: '검색 결과가 없습니다.');
      } else if (address.common.errorCode != '0'){
        throw _error = ErrorModel(statusCode: 0, error: 0, meassge: address.common.errorMsg);
      }

      errorMessage.value = _error!.meassge;

      if(pageNumber == 1) _addressList.clear();
      if(_error.error == -101) page.value = -1;

      _addressList.addAll(address.jusoList);

    } catch (e) { 
      Get.defaultDialog(
        barrierDismissible: false,
        title: 'ERROR',
        titlePadding: const EdgeInsets.all(16),
        content:  Text('$e'),
        contentPadding: const EdgeInsets.all(16), 
        onConfirm: ()=> Get.back()
      );
      // logger.d(e);
    } 
  }

  String? httpGetQuery(String? query, String key, String value) {
    if (value == null) {
      return query;
    }
    String firstWord = query == null ? "?" : "$query&";
    return "$firstWord$key=$value";
  }

  void addScrollListener(){
    scrollController.addListener(() {
      FocusScope.of(Get.context!).unfocus();
    });
  }

  void addTextEditListener() {
    addrEdit.addListener(() async {
      if (keyword.value == addrEdit.text) return;
      keyword.value = addrEdit.text;
      page.value = 1;
      fetchAddress(keyword.value, page.value);
    });
  }

  @override
  void dispose() {
    addrEdit.dispose();
    scrollController.dispose();
    super.dispose();
  }
}