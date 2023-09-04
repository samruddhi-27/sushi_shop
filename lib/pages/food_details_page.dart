import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_shop/components/button.dart';
import 'package:sushi_shop/models/food.dart';
import 'package:sushi_shop/pages/colors.dart';

import '../models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;

  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      if(quantityCount>0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }
  void addtoCart(){
    if(quantityCount > 0){
      final shop = context.read<Shop>();
      shop.addtoCart(widget.food, quantityCount);

      showDialog(context: context,
        barrierDismissible: false,
        builder: (context)=> AlertDialog(
          backgroundColor: sred,
        content: const Text("Successfully added to cart",
        style: TextStyle(
          color: Colors.white
        ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
            Navigator.pop(context);
          },
              icon: const Icon(Icons.done,
              color: Colors.white,
              ),
          ),
        ],
      ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          //lisview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    "Salmon sushi is a culinary masterpiece, embodying the essence of Japanese cuisine. Delicate, buttery slices of fresh salmon rest atop perfectly seasoned sushi rice, a testament to precision and simplicity. Its vibrant orange hue and melt-in-your-mouth texture make it a symphony of flavors, a true delight for the senses.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //price+ qty
          Container(
            color: sred,
            padding: const EdgeInsets.all(23),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "\$" + widget.food.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 120),
                    Container(
                      decoration:
                          const BoxDecoration(color: pred, shape: BoxShape.circle),
                      child: IconButton(
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        onPressed: decrementQuantity,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          quantityCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration:
                          const BoxDecoration(color: pred,
                              shape: BoxShape.circle),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: incrementQuantity,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                MyButton(text: "Add to Cart", onTap: addtoCart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
