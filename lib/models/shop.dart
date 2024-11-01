import 'package:flutter/widgets.dart';
import 'package:restaurant_app/models/food.dart';

class Shop extends ChangeNotifier{
    final List <Food> _foodMenu = [

    Food(
      name: 'Salmon', 
      price: '19.99', 
      imagePath: 'lib/images/salmon_sushi.png', 
      rating: '4.9'
    ),

    Food(
      name: 'Tuna', 
      price: '24.99', 
      imagePath: 'lib/images/tuna.png', 
      rating: '4.5'
    ),
  ];

  //customer cart
  List <Food> _cart = [

  ];

  //getter methond
  List <Food> get foodMenu => _foodMenu;
  List <Food> get cart => _cart;

  //add to cart
  void addToCart (Food foodItem, int quantity) {
    for(int i=0; i < quantity; i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart (Food food){
    _cart.remove(food);
      notifyListeners();
  }
}