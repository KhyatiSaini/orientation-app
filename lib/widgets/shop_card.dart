import 'package:flutter/material.dart';
import 'package:orientation_app/classes/shop.dart';

class ShopCard extends StatelessWidget {
  Shop shop;

  ShopCard(this.shop);

  @override
  Widget build(BuildContext context) {


    print(shop.shopName);
    print(shop.description);
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30)
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(shop.shopName),
                subtitle: Text(shop.description),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
