import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/models/shop.dart';
import 'package:restaurant_app/themes/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity
  int quantityCount = 0;

  //decrease quantity
  void decreementQuantity (){
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //increase quantity
  void incrementQuabtity (){
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addToCart(){
    //only add to cart if the cart is not empty
    if (quantityCount > 0){
      //get access to shop
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantityCount);

      //let the user know it was successful
      showDialog(
        context: context,
        barrierDismissible: false, 
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: Text(
            "Successfully added to Cart",
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
           actions: [
            IconButton(
              onPressed: (){
                //pop once to remove dialog box
                Navigator.pop(context);

                //pop again to previous screen
                Navigator.pop(context);
              }, 
              icon: Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
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
          //listview of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children:[
                  //image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(height: 25),
            
                  //rating
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                        size: 16,
                      ),
            
                      const SizedBox(width: 5),
            
                      //rating
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  //name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 32,
                    ),
                  ),
                  
                  const SizedBox(height: 25),            
                  //description
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Discover the oceanic allure of tuna from our shop, where each bite is a symphony of freshness and flavor. From sushi rolls to vibrant salads, our diverse tuna offerings redefine seafood indulgence. Immerse yourself in premium quality and culinary finesse, elevating your dining experience with the versatile charm of tuna. Welcome to a world where every dish tells a tale of oceanic delight.',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      height: 2
                    ),
                  )
                ],
              ),
            ),
          ),

          //price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                //price and quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    //quantity
                    Row(
                      children: [
                        //minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decreementQuantity,
                          ),
                        ),
                        //quantity
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),

                        //add button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: incrementQuabtity,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                //add to cart button
                MyButton(text: 'Add To Cart', onTap: addToCart),
              ],
            ),
          )
        ],
      ),
    );
  }
}