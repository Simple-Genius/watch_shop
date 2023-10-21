import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:watch_shop/app/data/models/product_model.dart';
import 'package:watch_shop/app/data/services.dart';
import 'package:watch_shop/app/widgets/category.dart';
import 'package:watch_shop/app/widgets/product_item.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 10, bottom: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style:
                              TextStyle(color: Color(0xFF9A989C), fontSize: 18),
                        ),
                        Text(
                          'Krishna SN',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.dehaze)),
                ],
              ),
            ),
            Center(
              child: Container(
                height: 60,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 210, 210, 210),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ))
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Container(
                height: Get.height * 0.27,
                width: Get.width,
                color: Color(0xFFEBE2DA),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 20, bottom: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Get Pixel 7 and\nPixel 7 pro',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Text(
                          'Full speed ahead',
                          style: TextStyle(fontSize: 20),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffc9d3e1)),
                            onPressed: () {},
                            child: Text('Shop Now')),
                      ]),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 20),
              child: FutureBuilder(
                  future: dataService.getCategories(),
                  builder: (context, snapshot) {
                    return Container(
                      height: 53,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          if (snapshot.data == null) {
                            return const CircularProgressIndicator();
                          }
                          final category = snapshot.data![index].name;
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: CategoryTile(
                                categoryName: category ?? "Data not available"),
                          );
                        },
                      ),
                    );
                  }),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 22.0, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Arrival',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: TextStyle(color: Color(0xFF484848)),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: FutureBuilder(
                  future: dataService.getProducts(),
                  builder: (context, snapshot) {
                    return Container(
                      height: Get.height * 0.3,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            if (snapshot.data == null) {
                              return const CircularProgressIndicator();
                            }
                            final product = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: ProductItem(
                                title: product.title ?? "",
                                price: product.price.toString(),
                                description: product.description ?? "",
                                images: product.images ?? [],
                              ),
                            );
                          }),
                    );
                  }),
            ),
            //ProductItem()
          ],
        ),
      ),
    );
  }
}
