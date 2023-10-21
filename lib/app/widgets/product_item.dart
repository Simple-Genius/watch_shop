import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_shop/app/modules/home/views/product_view.dart';

class ProductItem extends StatelessWidget {
  final String title, price, description;
  final List<String> images;
  const ProductItem({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductView(title, price, description, images));
      },
      child: Container(
        width: 140,
        height: 200,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.4, 0],
              colors: [Color(0xFFEBE2DA), Colors.white70],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(images[0]),
              Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                description,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ $price',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
