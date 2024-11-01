import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/models/food.dart';
import 'package:restaurant_app/models/shop.dart';
import 'package:restaurant_app/themes/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeFromCart(Food food, BuildContext context){
    final shop = context.read<Shop>();

    shop.removeFromCart(food);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer <Shop> (
      builder: (context, value, child) => 
        Scaffold(
          backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: Text("My Cart"),
          backgroundColor: primaryColor,
          centerTitle: true,
        ),
        body: Column(
          children: [
            //customer cart
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index){
              //get food from cart
              final Food food = value.cart[index];
            
                  final String foodName = food.name;
            
                  // Get food price
                  final String foodPrice = food.price;
            
              //get list tile
              return Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: ListTile(
                  title: Text(
                    foodName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    foodPrice,
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: IconButton(onPressed: () => removeFromCart(food, context),
                  icon: Icon(Icons.delete,
                    color: Colors.grey[300],
                  ),),
                ),
              );
                  }),
            ),
      Padding(
        padding: const EdgeInsets.all(25),
        child: MyButton(text: "PAY NOW!!", onTap: (){

        },),
      )
          ],
        ),
    ),);
  }
}