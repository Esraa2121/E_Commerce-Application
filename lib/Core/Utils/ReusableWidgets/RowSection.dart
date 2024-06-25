import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';

class RowSection extends StatelessWidget {
  RowSection({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyColors.darkSlateGray),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'view all',
                style: TextStyle(fontSize: 15, color: MyColors.darkSlateGray),
              ))
        ],
      ),
    );
  }
}
