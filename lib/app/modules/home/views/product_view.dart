import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductView extends GetView {
  final String title, price, description;
  final List<String> images;
  const ProductView(this.title, this.price, this.description, this.images,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [0.5, 0],
          colors: [Color(0xFFC9D3E1), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 13.0, right: 13, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text(
                    'Product Details',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.favorite_border)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: Center(child: Image.network(images[0])),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text('\$ $price',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Text(
                  description,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Color.fromARGB(255, 90, 109, 134)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Color Available',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.network(images[0]),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.network(images[1]),
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.network(images[2]),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Center(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(40)),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: Size(300, 50)),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
