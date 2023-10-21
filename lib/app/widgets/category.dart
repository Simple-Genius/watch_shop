import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryTile extends StatelessWidget {
  final String categoryName;
  const CategoryTile({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: Get.width * 0.28,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 230, 228, 228),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          categoryName,
          style: TextStyle(fontSize: 16),
        )));
  }
}
