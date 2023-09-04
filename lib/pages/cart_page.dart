import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/components/button.dart';
import 'package:sushi_shop/models/food.dart';
import 'package:sushi_shop/pages/colors.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removefromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: sred,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: sred,
          title: const Text("MyCart"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Food food = value.cart[index];

                  // Get food from cart
                  final String foodName = food.name;

                  // Get food name
                  final String foodPrice = food.price;

                  // Return list tile
                  return Container(
                    decoration: const BoxDecoration(
                      color: pred,
                    ),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        foodPrice,
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[200],
                        ),
                        onPressed: () => removeFromCart(food, context),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyButton(text: "Pay Now", onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
