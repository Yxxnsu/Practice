import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:road_api_test/controller/address_controller.dart';
import 'package:road_api_test/models/juso_model.dart';
import 'package:road_api_test/screens/widgets/top_bar.dart';

class HomeScreen extends GetView<AddressController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
          child: Column(
            children: <Widget>[
              const TopBar(
                title: '주소 검색',
                height: 50,
                closeIcon: Icon(Icons.arrow_back_ios),
              ),
              Row(
                children: [
                  Expanded(
                    child: searchTextField(),
                  ),
                  Obx(()=> 
                    cancelWidget(),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              ElevatedButton(
                onPressed: ()=> controller.fetchAddress('종로', 1), 
                child: const Text('뭔데'),
              ),
              Expanded(
                child: Obx(
                  ()=> listView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchTextField() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 50,
      alignment: Alignment.center,
      child: TextField(
        controller: controller.addrEdit,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "주소 입력",
          hintStyle: TextStyle(color: Color(0xFFA0A0A0)),
        ),
      ),
    );
  }

  Widget cancelWidget() {
    if (controller.keyword.value.isEmpty) return Container();
    return GestureDetector(
      child: const Icon(
        Icons.cancel,
        color: Color(0xFFBFBFBF),
        size: 20,
      ),
      onTap: () => controller.addrEdit.clear(),
    );
  }

  Widget listView() {
    if (controller.addressList.isEmpty) {
      return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 15,
              color: const Color(0xFFEdEdEd),
            ),
            Expanded(
              child: Center(
                child: Text(controller.errorMessage.value),
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      controller: controller.scrollController,
      itemCount: controller.addressList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) return Container(height: 15, color: const Color(0xFFEdEdEd));
        if (index == controller.addressList.length) addAddressList();
        final address = controller.addressList[index - 1];
        return Column(
          children: [
            listItem(address),
            Container(
              height: 1,
              color: const Color(0xFFEdEdEd),
            ),
          ],
        );
      },
    );
  }

  Widget listItem(Juso address) {
    final roadLast = address.buldSlno == '0' ? '' : '-' + address.buldSlno!;
    final rodaTitle = '${address.rn} ${address.buldMnnm}$roadLast';
    final title = address.bdNm!.isEmpty ? rodaTitle : address.bdNm;

    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          Text(
            address.jibunAddr!,
            style: const TextStyle(color: Color(0xFFA8A8A8)),
          ),
          Text(
            '[도로명] ' + address.roadAddr!,
            style: const TextStyle(color: Color(0xFFA8A8A8)),
          ),
        ],
      ),
    );
  }

  void addAddressList() {
    if (controller.page.value == -1) return;
    ++controller.page.value;
    controller.fetchAddress(controller.keyword.value, controller.page.value);
  }
}
