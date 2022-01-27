import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getx_travel_crud/controller/controller.dart';
import 'package:getx_travel_crud/models/model.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  final List<Destination> dummy = Destination.getDestination();

  final _iconList = <IconData>[
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 36,
                ),
                Text(
                  'What you would like\nto find?',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      4,
                      (index) => GestureDetector(
                        onTap: () {
                          controller.selectedIndex = index;
                          controller.update();
                        },
                        child: GetBuilder<HomeController>(
                          builder: (_) {
                            return Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: _.selectedIndex == index
                                    ? Theme.of(context).primaryColor
                                    : const Color(0xFFB4C1C4),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                _iconList[index],
                                size: 25,
                                color: Theme.of(context).colorScheme.secondary,
                                //controller.seleted == index ? Theme.of(context).primaryColor : Color(0xFFB4C1C4),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Top Destinations',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print('See All'),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 265,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dummy.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => print('hello'),
                        child: Container(
                          width: 220,
                          // margin: const EdgeInsets.only(right: 10),

                          // TODO: Stack alignment와 positioned.
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                bottom: 15,
                                child: Container(
                                  height: 90,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${dummy[index].activities.length} activities',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          dummy[index].description,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // TODO: Container는 사이즈 안정하면 자식의 사이즈 받는다.
                              // TODO: BoxShadow로 뒤에 그림자 띠워줌.
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0.0, 2.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Hero(
                                      tag: dummy[index].imageUrl,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          20.0,
                                        ),
                                        child: Image(
                                          height: 180.0,
                                          width: 180.0,
                                          image: NetworkImage(
                                            dummy[index].imageUrl,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10.0,
                                      bottom: 10.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            dummy[index].city,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              const Icon(
                                                FontAwesomeIcons.locationArrow,
                                                size: 10.0,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(width: 5.0),
                                              Text(
                                                dummy[index].country,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Exclusive Hotel',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print('See All'),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => Container(
                    height: 265,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.hotel.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => print('hello'),
                          child: Container(
                            width: 220,
                            // margin: const EdgeInsets.only(right: 10),
                            // TODO: Stack alignment와 positioned.
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Positioned(
                                  bottom: 15,
                                  child: Container(
                                    height: 90,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.hotel[index].name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            controller.hotel[index].address,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            '${controller.hotel[index].price}\$ / night',
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // TODO: Container는 사이즈 안정하면 자식의 사이즈 받는다.
                                // TODO: BoxShadow로 뒤에 그림자 띠워줌.
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: Hero(
                                    tag: controller.hotel[index].imageUrl,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        20.0,
                                      ),
                                      child: Image(
                                        height: 180.0,
                                        width: 180.0,
                                        image: NetworkImage(
                                          controller.hotel[index].imageUrl,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
