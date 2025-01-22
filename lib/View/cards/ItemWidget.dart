import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../../model/Items Respoce Model.dart';

class ItemWidget extends StatelessWidget {
  final ItemsRespoceModel item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.blue[900] ?? Colors.blueAccent)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  child: Image.network(
                    item.image ?? '',
                    height: 120  ,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LikeButton(),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '(${item.category})',
                    style: const TextStyle(fontSize: 14),
                  ),
                  Container(
                    height: 30,

                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        item.title ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${item.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      Text(
                        '${item.rating?.rate}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '(${item.rating?.count})',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Spacer(),
                      ImageIcon(AssetImage("assets/images/Vector.png")),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
